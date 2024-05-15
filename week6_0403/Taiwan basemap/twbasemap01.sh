# Taiwan basemap
# Created by Jyr-Ching Hu for GMT6
prefix=tw_basemap01
grd=../grdfiles/tw30m_aster.nc
range=119.2/122.5/21.5/25.5 
cpt=tw_topo.cpt

gmt gmtset FORMAT_GEO_MAP ddd:mm:ssF
gmt makecpt -Cdem3 -T0/4000/500 -Z > $cpt

gmt begin $prefix jpg A+m0.5i
    gmt basemap -R$range -JM121/15c -Bxa1f0.5 -Bya1f0.5 -BWeSn+t"Taiwan Basemap" --FONT_TITLE=24p,AvantGarde-Demi,black -X1 -V
    gmt grdimage $grd -C$cpt -I+a45+ne1.0 -V
    gmt plot Taiwan_county_WGS84.gmt -W0.3p,azure -V
    gmt coast -Df -W0.3p,0 -Slightcyan -V
	gmt colorbar -C$cpt -Dx7c/-1.7c+w16c/0.3c+jTC+h+e+ml -I -Bxa1000f500g500+l"Elevation (30 m GDEM)" -By+lm -V
gmt end

# rm *.conf *.history