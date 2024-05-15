REM  Ex01a Bathymetry and Topography in and around Taiwan
REM  Batch file to create Postscript plot of gridded data using GMT 
REM  Version 6.0.0 utilities 
REM  Created by Jyr-Ching Hu, Department of Geosciences, National Taiwan University
REM  DOS prompt: del, pause
REM  gmt programs: gmtset, bsemap, grdgrdient, grdimage, coast, colorbar
REM  Data source: tw_topo500m.nc. Courtesy of National Center for Ocean Research (NOCR)

set prefix=Lect02C
set grd=tw_relief_15s.nc
set int=tw_relief_15s.nc.int
set range=118.5/123.5/20.0/26.5
REM set cpt=topo_sealand.cpt

gmt set FORMAT_GEO_MAP=ddd:mm:ssF
gmt set MAP_FRAME_TYPE=fancy+
gmt set PS_MEDIA=Letter
gmt get MAP_FRAME_TYPE
gmt get FORMAT_GEO_MAP
gmt set FONT_LABEL=16p,Helvetica,black FONT_ANNOT_PRIMARY=12p,Helvetica,black ^
MAP_SCALE_HEIGHT=8p MAP_TICK_PEN_PRIMARY=thinner,black

echo grdcut, extract subregion from a grid (earth_relief_15s.nc, remote downloading)
gmt grdcut @earth_relief_15s -R%range% -G%grd%
echo gridinfo, extract information from netCDF grid file 
gmt grdinfo %grd% > tw_relief_15s.nc.info
type tw_relief_15s.nc.info

gmt begin %prefix% ps,jpg A+m0.5c
  gmt makecpt -Csealand -T-8000/4000/500
  gmt grdgradient %grd% -A10/100 -G%int% -Ne1 -fg -V
  gmt grdimage %grd% -Jm123/23/3c -R%range% -I%int%  -V
  gmt coast -Ba1f0.5 -Df -Ia/1p,blue -Lg122/26+c23+w200k+l+f -W1 -V
  gmt colorbar -Dx-0.5c/-1.5c+w15c/0.4c+h -Bf200a1000 -I -V
gmt end

REM gmt psconvert %prefix% -Tt -A0.5i -E400
del %int%
pause