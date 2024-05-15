REM Batch file made by Hu Jyr-Ching, Department of Geosciences, NTU
REM Edited by Bo-Han Tsao and Jyr-ching HU in GMT6

set prefix=Lect05D1

set range=120.5/122.2/24.30/25.50
set grd1=c:/gridfiles/TW_20m_WGS84.nc
set grd2=c:/gridfiles/Taidp200m.nc
set outgrid=northTaiwan.nc
set cpt=topo_compo.cpt

gmt grdinfo %grd1% > TW_20m_WGS84.nc.info
type TW_20m_WGS84.nc.info
REM make a composite cpt with two master cpt
gmt makecpt -Cocean -T-8000/0/250 -N > %cpt%
gmt makecpt -Cdem2 -T0/4000/250 >> %cpt% 

set area=30000
gmt coast -R%range% -A%area% -Df -W -M > Tw_shoreline.txt


gmt begin %prefix% jpg A+m0.5c
    REM Draw basemap
    gmt basemap -R%range% -JM121/15c -Bxa0.5f0.25 -Bya0.5f0.25 -BWeSn+t"Relief of Northern Taiwan" -V
    gmt grdimage %grd2% -C%cpt% -I+a320+nt1.0 -V
    
    REM clip path using shoreline data of Taiwan and fill in 20 m DEM 
    gmt clip Tw_shoreline.txt -V
    gmt grdimage %grd1% -C%cpt% -I+a320+nt1.0 -V
    gmt clip -C -V
    gmt plot Tw_shoreline.txt -W1.5p,255/255/255 -V
	gmt colorbar -C%cpt% -Dx7c/-1.7c+w16c/0.3c+jTC+h+e+ml -I -Bxa1000f500g500+l"Elevation (20 m DEM inland, 200 m offshore)" -By+lm -V
gmt end

del *.int
del *.grd *.conf
del gmt.history 
pause