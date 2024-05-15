#Batch file made by Hu Jyr-Ching, Department of Geosciences, NTU
#Edited by Jyr-ching HU in GMT6

prefix=EX01
range=117.0/125.0/18.0/27.0
# grd1=../grdfiles/TW_20m_WGS84.nc
# grd2=../grdfiles/Taidp200m.nc

grd="hsu_bg_1m.grd" 
#grd="hsu_grav_1m.grd"
#grd="hsu_mag_1m.grd"

gmt makecpt -Cvik -T-180/240/100 -I -Z > $cpt
gmt grdcut -G$grd -R$range -V

gmt grdinfo $grd > $grd.info
cat $grd.info
# gmt makecpt -H -Cocean -T-100/0/10 -N > $cpt1
# gmt makecpt -H -Cdem2 -T0/100/10 >> $cpt1

gmt begin $prefix jpg A+m0.5c
    gmt basemap -R$range -JM121/15c -Bxa0.5f0.25 -Bya0.5f0.25 -BWeSn+t"R12224203_Exercise05" -V
    gmt grdimage $grd -C$cpt -I+a320+nt1.0 -V
    gmt grdcontour $grd -C10 -A50 -W0.1p,black -V 
    gmt coast -Df -W1.0p,255/255/255 -R$range -U -A10000 -W0.5,black -ECN,PH,JP+gwhite 
    echo 118.0 26.0 CHINA | gmt text -R$range -F+f20p,Helvetica-Bold,black -Dj0.1c/0.1c   
    echo 121.2 18.15 LUZON | gmt text -R$range -F+f10p,Helvetica-Bold,black -Dj0.1c/0.1c   
	gmt colorbar -C$cpt -Dx8c/1c+w12c/0.5c+jTC+h -I -Bxa30f10g10+l"bouger gravity anomaly" -By+lm -V -X+0.5 -Y-2.5
gmt end

# rm *.nc *.conf