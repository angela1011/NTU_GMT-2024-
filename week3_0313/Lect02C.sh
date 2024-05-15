#  Ex01a Bathymetry and Topography in and around Taiwan
#  Batch file to create Postscript plot of gridded data using GMT 
#  Version 6.0.0 utilities 
#  Created by Jyr-Ching Hu, Department of Geosciences, National Taiwan University
#  Linux-like commands: rm
#  gmt programs: gmtset, bsemap, grdgrdient, grdimage, coast, colorbar
#  Data source: earth_relief_15s.nc, remote downloading)

prefix=Lect02C
grd=tw_relief_15s.nc
int=tw_relief_15s.nc.int
range=118.5/123.5/20.0/26.5
cpt=my1st.cpt 
gmt set PS_MEDIA = letter
gmt get PS_MEDIA
gmt get MAP_FRAME_TYPE
gmt get FORMAT_GEO_MAP

gmt set FORMAT_GEO_MAP ddd:mm:ssF
gmt set MAP_FRAME_TYPE=fancy
gmt set PS_MEDIA = a4
gmt set FONT_LABEL=16p,Helvetica,black FONT_ANNOT_PRIMARY=12p,Helvetica,black \
MAP_SCALE_HEIGHT=8p MAP_TICK_PEN_PRIMARY=thinner,black
echo "grdcut, extract subregion from a grid (earth_relief_15s.nc, remote downloading)"
gmt grdcut @earth_relief_15s -R${range} -G${grd}
echo "gridinfo, extract information from netCDF grid file" 
gmt grdinfo ${grd} > tw_relief_15s.nc.info

gmt begin ${prefix} ps,jpg A+m0.5c
  makecpt -Csealand -T-8000/4000/500
  gmt grdgradient ${grd} -A10/100 -G${int} -Ne1 -fg -V
  gmt grdimage ${grd} -Jm123/23/3c -R${range} -C${cpt} -I${int} -V
  gmt coast -Ba1f0.5 -Df -Ia/1p,blue -Lg122/26+c23+w200k+l+f+u -W1 -V -Tdg122.5/25+w1i+lw,e,s,n
  gmt colorbar -Dx17c/3c+w16c/0.4c -C${cpt} -Bf200a1000 -I -V
#-Tdg122.5/25+w1i+lw,e,s,n
#-Tdg122.5/25+w1i+lw,e,s,n+f1
#-Tdg122.5/25+w1i+f3
#-Lg122/26+c23+w200k+l+f
#-Dx-0.5c/-1.5c+w-15c/0.4c+h –I0.5 
gmt end

# gmt psconvert ${prefix} -Tt -A0.5i -E400
rm ${int}
