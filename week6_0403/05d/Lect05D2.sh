#Batch file made by Hu Jyr-Ching, Department of Geosciences, NTU
#Edited by Jyr-ching HU in GMT6

prefix=Lect05D2
range=120.5/122.2/24.30/25.50
grd1=../grdfiles/TW_20m_WGS84.nc
grd2=../grdfiles/Taidp200m.nc
outgrid=northTaiwan.nc
cpt=topo_compo.cpt

gmt grdinfo $grd1 > TW_20m_WGS84.nc.info
cat TW_20m_WGS84.nc.info
#make a composite cpt with two master cpt
gmt makecpt -H -Cocean -T-8000/0/250 -N > $cpt
gmt makecpt -H -Cdem2 -T0/4000/250 >> $cpt 

gmt begin $prefix jpg A+m0.5c
    #Draw basemap
    gmt basemap -R$range -JM121/15c -Bxa0.5f0.25 -Bya0.5f0.25 -BWeSn+t"Relief of Northern Taiwan" -V
    gmt grdimage $grd2 -C$cpt -I+a320+nt1.0 -V
	
    #clip path using shoreline data of Taiwan and fill in 20 m DEM 
    gmt coast -Df -Gc -V
    gmt grdimage $grd1 -C$cpt -I+a320+nt1.0 -V
    gmt coast -Q -V
    gmt coast -Df -W1.5p,255/255/255 -V
	gmt colorbar -C$cpt -Dx7c/-1.7c+w16c/0.3c+jTC+h+e+ml -I -Bxa1000f500g500+l"Elevation (20 m DEM inland, 200 m offshore)" -By+lm -V
gmt end
# rm *.nc *.conf