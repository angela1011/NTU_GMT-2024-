REM  Ex01A Bathymetry and Topography in and around Taiwan
REM  Batch file to create Postscript plot of gridded data using GMT 
REM  Version 6.5.0 utilities 
REM  Created by Jyr-Ching Hu, Department of Geosciences, National Taiwan University
REM  DOS prompt: del, pause
REM  gmt commands: gmtset, basemap, grdgrdient, grdimage, coast
REM  Data source: tw_topo500m.nc. Courtesy of National Center for Ocean Research (NOCR)

set prefix=Lect02A1_tw_topo500m
set grd=c:\gridfiles\tw_topo500m.nc
set int=tw_topo500m.nc.int

gmt set MAP_FRAME_TYPE = plain
gmt set FORMAT_GEO_MAP = ddd:mm:ssF
gmt set PS_MEDIA = letter

echo gridinfo, extract information from netCDF grid file 
gmt grdinfo %grd% > tw_topo500m.nc.info

gmt begin %prefix% ps,jpg A+m0.5c
  echo constructing the basemap
  gmt basemap -Jm121/23/1i -R118.5/123.5/20/26.5 -Ba2f1 -U/-0.1i/-0.5i/"Geodesy and Remote Sensing Lab, NTU"  -V
  echo Compute gradient of grid, intensity file
  gmt grdgradient %grd% -A10/100 -G%int% -Ne1 -fg -V
  echo grdimage, shading
  gmt grdimage %grd% -Ctopo_sealand.cpt -I%int%
  echo coast, coastline in black(R/G/B=0/0/0)-V
  gmt coast -Df -W0.8p,0/0/0 -V
gmt end

REM gmt psconvert %prefix% -Tt -A0.5i -E400
del %int%
pause