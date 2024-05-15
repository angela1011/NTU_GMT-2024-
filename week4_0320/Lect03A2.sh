# Bathymetry and Topographic Map of Taiwan  
# Batch file to create Postscript plot of gridded data using GMT 
# Created by Jyr-Ching Hu, Department of Geosciences, National Taiwan University
# DOS prompt: del, set
# gmt programs: makecpt, grdimage, coast, colorbar
# data source: # extract a subset of the global 30” DEM called SRTM30+

prefix=Lect03A2
grd=tw_relief_15s.nc
range=119/123/21/26
gmt set FORMAT_GEO_MAP ddd:mm:ssF
gmt set GMT_DATA_SERVER_LIMIT 0

gmt grdcut @earth_relief_15s -R$range -G$grd
gmt grdinfo $grd > tw_relief_15s.nc.info
cat tw_relief_15s.nc.info

gmt begin $prefix jpg A+m0.5c
  gmt grdimage $grd -JM123/23/12c -Ba1f0.5 -R$range -I+d -V
  gmt coast -Df -W1 -V 
  gmt colorbar -Dx5.7c/-1.2c+w14c/0.5c+h+jTC -By+lm -Bxa2000f500g500+l"Relief (SRTM15+)" -I -V
gmt end

rm *.conf *.info