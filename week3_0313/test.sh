#  Ex01a Bathymetry and Topography in and around Taiwan
#  Batch file to create Postscript plot of gridded data using GMT 
#  Version 6.0.0 utilities 
#  Created by Jyr-Ching Hu, Department of Geosciences, National Taiwan University
#  Linux: rm, echo
#  gmt programs: gmtset, bsemap, grdgrdient, grdimage, coast
#  Data source: tw_topo500m.nc. Courtesy of National Center for Ocean Research (NOCR)

prefix=Lect02A2_tw_relief_15s
grd=tw_relief_15s.nc
range=118.5/123.5/20/26.5
int=tw_relief_15s.nc.int
gmt set MAP_FRAME_TYPE plain
gmt set FORMAT_GEO_MAP ddd:mm:ssF
gmt set PS_MEDIA = letter
echo "grdcut, extract subregion from a grid (earth_relief_15s.nc, remote downloading)"
gmt grdcut @earth_relief_15s -R${range} -G${grd}
echo "gridinfo, extract information from netCDF grid file" 
gmt grdinfo ${grd} > tw_relief_15s.nc.info
gmt begin ${prefix} ps,jpg A+m0.5c
  echo "constructing the basemap"
  gmt basemap -Jm121/23/1i -R${range} -Ba2f1 -U/-0.1i/-0.5i/"Geodesy and Remote Sensing Lab, NTU" -V
  echo "Compute gradient of grid, intensity file"
  gmt grdgradient ${grd} -A10/100 -G${int} -Ne1 -fg -V
  echo "grdimage, shading"
  gmt grdimage ${grd} -Ctopo_sealand.cpt -I${int} -V
  echo "coast, coastline in black(R/G/B=0/0/0)"
  gmt coast -Df -W0.8p,0/0/0 -V
gmt end show
# gmt psconvert ${prefix} -Tt -A0.5i -E400
# rm /mnt/d/gmtwork/Lect02/${int}
