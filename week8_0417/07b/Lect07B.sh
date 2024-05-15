# orginal batch file was from Yen-Shiang Chang, Institute of Oceanography, NTU
# batch file was modified by Jyr-Ching Hu, Department of Geosciences

prefix=Lect07B
range=65/115/20/50
cpt=topo_dem3.cpt
grd1=../grdfiles/GEBCO_2023_sub_ice_topo.nc
grd2=Tibet.nc

gmt gmtset PROJ_LENGTH_UNIT inch
# ====== Plot Basemap =====
gmt grdcut $grd1 -G$grd2 -R$range -V
# gmt grd2cpt $grd2 -Cwiki-2.0 -L-2000/9000/250 -Z > $cpt -V
gmt makecpt -Cdem3 -T0/9000/500 -Z > $cpt -V

gmt begin $prefix jpg A+m0.5c
	gmt grdimage $grd2 -JM121/15c -R70/110/20/45 -C$cpt -I+d -Bxa5f5 -Bya5f5 -B+t"Tibetan Plateau" -V -Y5i 
	gmt coast -Df -B -W1.5p,255 -V
	gmt coast -Df -B -N1/1.2p,0 -W1p -V
	gmt colorbar -C$cpt -Dx0/-1.5c+w15c/0.3c+h+e -S -Bxa2000f500 -By+lm -I -V
# ====== Separate different tectonic regimes  =====
	awk '{if ($16 >= 52 && $10 <= 35) print $3, $2, $5, $18, $19, $20, $6, $3, $2 }' hiclimb.txt | gmt meca \
	-Sa0.5c -G0/0/255 -h4 -A -L -V
	awk '{if ($16 < 52 && $16 >= 40 && $10 <= 20) print $3, $2, $5, $18, $19, $20, $6, $3, $2 }' hiclimb.txt | gmt meca \
	-Sa0.5c -h4 -G0/200/255 -A -L -V
	awk '{if ($16 < 40 && $10 <= 20 && $13>=45) print $3, $2, $5, $18, $19, $20, $6, $3, $2 }' hiclimb.txt | gmt meca \
	-Sa0.5c -h4 -G0/255/0 -A -L -V
	awk '{if ($16 <= 20 && $10 < 40 && $13>=45) print $3, $2, $5, $18, $19, $20, $6, $3, $2 }' hiclimb.txt | gmt meca \
	-Sa0.5c -h4 -G0/255/0 -A -L -V
	awk '{if ($16 <= 20 && $10 >= 40 && $10 < 52) print $3, $2, $5, $18, $19, $20, $6, $3, $2 }' hiclimb.txt | gmt meca \
	-Sa0.5c -h4 -G255/200/0 -C -L -V
	awk '{if ($16 <= 35 && $10 >= 52) print $3, $2, $5, $18, $19, $20, $6, $3, $2 }' hiclimb.txt | gmt meca \
	-Sa0.5c -G255/0/0 -h4 -A -L -V
	
# ====== Plot Legend =====
	gmt legend neis.legend -Dx3i/-1.2i+w7i/1.7i+jTC -Jx1i -R0/8/0/8 -F+glightyellow+p+r -V
	
gmt end

rm *.conf *.history