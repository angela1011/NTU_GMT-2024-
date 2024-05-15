# orginal batch file was from Yen-Shiang Chang, Institute of Oceanography, NTU
# batch file was modified by Jyr-Ching Hu, Department of Geosciences

prefix=EX07
range=118/124.5/19.5/26.5
#65/115/20/50
cpt=topo_dem3.cpt
grd1=../grdfiles/tw80m.nc
grd2=../grdfiles/Taidp200m.nc
meca=meca.txt

gmt gmtset PROJ_LENGTH_UNIT inch
# ====== Plot Basemap =====
gmt grdcut $grd1 -G$grd2 -R$range -V
# gmt grd2cpt $grd2 -Cwiki-2.0 -L-2000/9000/250 -Z > $cpt -V
gmt makecpt -Cdem3 -T0/9000/500 -Z > $cpt -V
gmt makecpt -Cocean -T-8000/0/250 -N  > $cpt
gmt makecpt -Cdem2 -T0/4000/250   >> $cpt

gmt begin $prefix jpg A+m0.5c
	gmt grdimage $grd2 -JM121/15c -R118/124.5/19.5/26.5 -C$cpt -I+d -Bxa5f5 -Bya5f5 -B+t"R12224203_Taiwan" -V -Y5i 
	gmt coast -Df -B -Slightcyan -W1.5p,255 -V
	gmt coast -Df -B -N1/1.2p,0 -W1p -V
	gmt colorbar -C$cpt -Dx0/-1.5c+w15c/0.3c+h+e -S -Bxa2000f500 -By+lm -I -V
# ====== Separate different tectonic regimes  =====
	awk '{if ($4 >= 30 ) print $0 }' meca.txt | gmt meca -Sa0.5c -G0/0/255 -h4 -A -L -V
	awk '{if ($4 >= 50 && $4 <= 30) print $0 }' meca.txt | gmt meca -Sa0.5c -h4 -G0/200/255 -A -L -V
	awk '{if ($4 <= 100 && $4 >= 50) print $0 }' meca.txt | gmt meca -Sa0.5c -h4 -G0/255/0 -A -L -V
	awk '{if ($4 <= 200 && $4 >= 100) print $0 }' meca.txt | gmt meca -Sa0.5c -h4 -G0/255/0 -A -L -V
	awk '{if ($4 <= 300 && $4 >= 200) print $0 }' meca.txt | gmt meca -Sa0.5c -h4 -G255/200/0 -C -L -V
	awk '{if ($4 >= 300) print $0 }' meca.txt | gmt meca -Sa0.5c -G255/0/0 -h4 -A -L -V
	# gmt meca meca.txt -A+s0.2c -Sa1.3c -C -V
	#Longitude Latitude 0 strike1 dip1 slip1 ML 0 0 event

# ====== Plot Legend =====
	gmt legend neis.legend -Dx3i/-1.2i+w7i/1.7i+jTC -Jx1i -R0/8/0/8 -F+glightyellow+p+r -V
	
gmt end

rm *.conf *.history