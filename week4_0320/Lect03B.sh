# Bathymetry and Topographic Map of Taiwan  
# Batch file to create Postscript plot of gridded data using GMT 
# Created by Jyr-Ching Hu, Department of Geosciences, National Taiwan University
# DOS prompt: del, set
# gmt programs: makecpt, grdimage, coast, colorbar
# data source, Taidp200m.nc courtesy of National Center for Ocean Research (NOCR)

prefix=Lect03B
# grd=/mnt/c/gridfiles/Taidp200m.nc
grd=Taidp200m.nc
range=119/123/21/26
gmt set FORMAT_GEO_MAP ddd:mm:ssF

gmt grdinfo $grd > Taidp200m.nc.info
cat Taidp200m.nc.info

gmt begin $prefix jpg A+m0.5c
  gmt grd2cpt $grd -Cworld -Z
  gmt grdimage $grd -R$range -JM123/23/12c -Ba1f0.5 -I+d -V
  gmt coast -Df -W1 -V 
  gmt colorbar -Dx5.7c/-1.2c+w14c/0.5c+h+jTC -By+lm -Bxa2000f500g500+lElevation -I -V
gmt end

rm *.conf *.info