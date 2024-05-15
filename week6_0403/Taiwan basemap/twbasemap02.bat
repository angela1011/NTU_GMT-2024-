REM Batch file made by Hu Jyr-Ching, Department of Geosciences, NTU
REM Created by Jyr-ching HU using GMT6 module 

set prefix=twbasemap02

set range=119/123/21/26
set grd1=../grdfiles/tw30m_aster.nc
set grd2=../grdfiles/Taidp200m.nc
set cpt=topo_wiki-2.0.cpt

REM make a composite cpt with two master cpt
REM gmt makecpt -H -Cwiki-2.0.cpt -T-6000/4000 -Z > topo_wiki-2.0.cpt
REM gmt grd2cpt %grd% -L-6000/4000 -T-6000/4000 -Z -Cwiki-2.0 > %cpt% 

gmt begin %prefix% jpg A+m0.5c
    REM Draw basemap
    gmt basemap -R%range% -JM121/15c -Ba1f0.5 -BWeSn+t"Relief of Taiwan" -V
    gmt grdimage %grd2% -C%cpt%  -I+d -V
    
    REM clip path using shoreline data of Taiwan and fill in 30 m DEM 
    gmt coast -Df -Gc -V
    gmt grdimage %grd1% -C%cpt% -I+d -V
    gmt coast -Q -V
    gmt coast -Df -W1.2p,black -V
	gmt colorbar -C%cpt% -Dx7c/-1.7c+w16c/0.3c+jTC+h+e+ml -I -Bxa1000f500g500+l"Elevation (30 m DEM inland, 200 m offshore)" -By+lm -V
gmt end

del *.nc *.conf
pause