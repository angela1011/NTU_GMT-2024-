# Bathymetry and Topographic Map of Taiwan  
# Batch file to create Postscript plot of gridded data using GMT 
# Created by Jyr-Ching Hu, Department of Geosciences, National Taiwan University
# shell commands: rm, cat
# gmt programs: makecpt, grdimage, coast, colorbar
# data source, Taidp200m.nc courtesy of National Center for Ocean Research (NOCR)

prefix=Lect03A1
# grd=/mnt/c/gridfiles/Taidp200m.nc
grd=Taidp200m.nc
# grd=Taidp200m.nc
range=119/123/21/26
gmt set FORMAT_GEO_MAP ddd:mm:ssF

# gmt set PS_MEDIA a4

gmt grdinfo ${grd} > Taidp200m.nc.info
cat Taidp200m.nc.info
gmt begin ${prefix} png #tif A+m0.5c
  #gmt makecpt -Crainbow -T-8000/4000/500 
  gmt makecpt -Cgeo -T-8000/4000 -Z #-T-8000/4000 #-T-8000/4000 -Z #-T-8000/4000/500
  gmt grdimage ${grd} -Jm123/23/3c -R${range} -I+a110+ne0.8 -V #-I+d
  gmt coast -Df -Ba1f0.5 -W1 -V 
  gmt colorbar -Dx5.5c/-1.2c+w12c/0.5c+h+jTC -Bxa2000f500g500+lElevation -By+lm -I -V
gmt end  
 
rm *.conf *.info