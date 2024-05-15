REM Taiwan basemap
REM Created by Jyr-Ching Hu for GMT6

set prefix=tw_basemap01
set grd=c:/gridfiles/tw30m_aster.nc
set range=119.2/122.5/21.5/25.5 
set cpt=tw_topo.cpt

gmt gmtset FORMAT_GEO_MAP ddd:mm:ssF
gmt makecpt -Ccpt-city/dem1 -T0/4000/500 -H > %cpt%
REM gmt grd2cpt %grd% -L0/4000 -T0/4000/200 -Z -Cdem3

gmt begin %prefix% jpg A+m0.5i
    gmt basemap -R%range% -JM121/15c -Bxa1f0.5 -Bya1f0.5 -BWeSn+t"Taiwan Basemap" --FONT_TITLE=24p,AvantGarde-Demi,black -X1 -V
    gmt grdimage %grd% -C%cpt% -I+a45+ne1.0 -V
    gmt plot Taiwan_county_WGS84.gmt -W0.3p,azure -V
    gmt coast -Df -W0.3p,0 -Slightcyan -V
	gmt colorbar -C%cpt% -Dx7c/-1.7c+w16c/0.3c+jTC+h+e+ml -I -Bxa1000f500g500+l"Elevation (30 m GDEM)" -By+lm -V
gmt end

del *.conf *.history
pause
