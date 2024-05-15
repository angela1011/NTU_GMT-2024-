REM Illumination and intensities
REM extract a subset of the global 30” DEM called SRTM30+:

set prefix=Tut_15
set range=119/123/21/26
set grd=tw_relief.nc

gmt set MAP_ORIGIN_X 1i MAP_ORIGIN_Y 2i
gmt set PROJ_LENGTH_UNIT inch
gmt set FORMAT_GEO_MAP ddd:mm:ssF
gmt set GMT_DATA_SERVER_LIMIT 0

gmt grdcut @earth_relief_30s -R%range% -G%grd%
gmt grdinfo %grd% > Tw_relief.nc.info
type Tw_relief.nc.info

gmt begin %prefix% png A+m0.5c
  gmt makecpt -Crainbow -T-8000/4000/500
  gmt grdimage %grd% -Jm123/23/3c -R%range% -I+d -V
  gmt coast -Df -Ba1f0.5 -W1 -V 
  gmt colorbar -Dx5.5c/-1.2c+w12c/0.5c+h+jTC -By+lm -Bxa2000f500g500+lElevation -I -V
gmt end show
pause 