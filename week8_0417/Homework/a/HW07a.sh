prefix=HW07a
grd1=../../grdfiles/tw80m.nc
grd2=../../grdfiles/Taidp200m.nc
data=AS_TS.txt 
int1=tw30m_aster.nc.in
int2=Taidp200m.nc.int
cpt1=fpcolor.cpt
InSAR=asc_phasefilt_ll.grd
seis="2018new.txt"
cmt="2018RQ_CMT.txt"

range=119/123/21/26 # for InSAR

# Cut a region based on InSAR
gmt grdcut $grd -R$range -G$topo
# create cpt for DEM　InSAR
gmt makecpt -Cgray -T0/4000/500 -I -N > $cpt1 -V
gmt makecpt -Cjet -T-3.14/3.14 -Ww > $cpt2 -V

gmt begin $prefix jpg A+m0.5c
    # create basemap
	gmt basemap -R$range -JM121/15c -Ba1f0.5 -BWESN+t"Ascemding Interferogram" -V -U
	gmt grdimage $grd2 -CGray  -I+d -V
    gmt grdimage $grd1 -CGray -I+d -V
    gmt coast -S212/231/237 -Df -W0.5p,black -V 
	# plot earthquake sequence
	awk '{if ($8 > 2.0 && $8 < 3.0) print $6, $5 }' $seis | gmt plot -Sc6p -W0.25p,black -G0/255/255 -V
	awk '{if ($8 > 3.0 && $8 < 4.0) print $6, $5 }' $seis | gmt plot -Sc8p -W0.25p,black -G0/255/255 -V
	awk '{if ($8 > 4.0 && $8 < 5.0) print $6, $5 }' $seis | gmt plot -Sc10p -W0.25p,black -G0/255/255 -V
	awk '{if ($8 > 5.0 && $8 < 6.0) print $6, $5 }' $seis | gmt plot -Sc12p -W0.25p,black -G0/255/255 -V
	awk '{if ($8 > 6.0 && $8 < 7.0) print $6, $5 }' $seis | gmt plot -Sa14p -W0.25p,black -G255/255/0 -V
	awk '{if ($8 > 7.0) print $6, $5 }' $seis | gmt plot -Sa16p -W0.25p,black -G255/0/0 -V
	# plot focal mechanisms bsed on CMT of 2019 earthquake
	gmt meca $cmt -Sa40p -W0.25p,black -Gred -C -V
	gmt end

# rm *.conf *.history phase.cpt 