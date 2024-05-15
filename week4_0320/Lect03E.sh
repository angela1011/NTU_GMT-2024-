# Bathymetry and Topographic Map of Word: one minute global data 
# Batch file to create Postscript plot of gridded data using GMT 
# Version 5.3.1 utilities 
# Created by Cho-In, Department of Geosciences, National Taiwan University
# Modified by Jyr-Ching Hu
# DOS prompt: type, del, pause
# gmt programs: grdinfo, grdcut, grdgradient, grdimage, pscoast, pascale
# data source: ETOPO1_Bed_g_gmt4.grd
# detail see etopo1.grd.info

prefix=Lect03E
# grd1=earth_relief_01m.grd
# grd2=GEBCO_2023_sub_ice_topo.nc
grd3=china_earth_relif_01m.nc
grd4=china_GEBCO.nc
range=55/140/10/55
cpt=gltopo.cpt
int=china.nc.int

gmt gmtset MAP_ORIGIN_X 1i MAP_ORIGIN_Y 2i
gmt gmtset PROJ_LENGTH_UNIT inch
gmt gmtset FORMAT_GEO_MAP ddd:mm:ssF
gmt gmtset FONT_ANNOT_PRIMARY 9p
gmt gmtset MAP_FRAME_WIDTH 0.1c


# gmt grdcut @$grd1 -G$grd3 -R$range
# gmt grdcut $grd2 -G$grd4 -R$range
gmt grdinfo $grd3 > china_earth_relif_01m.nc.info
cat earth_relief_01m.grd.info
gmt grdinfo $grd4 > china_GEBCO.nc.info
cat GEBCO_2023_sub_ice_topo.nc.info

gmt begin $prefix jpg A+m0.5c
gmt grdgradient $grd3 -A310 -G$int -Ne0.8 -fg -V
gmt grdimage $grd3 -R$range -JM97.5/35N/20C -C$cpt -I$int -V 
echo Draw Provinces of China and active faults
gmt plot China_provinces.gmt -W0.4p,white -V
gmt plot China_active_faults.gmt -W0.3p,red -h9 -V
gmt coast -A1000 -Di -N1/0.6p -Bxf5a10 -Byf5a10 -W0.5p -V
echo Draw  inset
gmt inset begin -DjTL+w1i+o0.15i/0.1i -F+gwhite+p1p+c0.1c
gmt coast -JG100/35N/? -Rg -Bg -Wfaint -Gchartreuse -ECN+gbisque -A5000
gmt inset end
gmt colorbar -Dx10c/-1c+w20c/0.5c+h+jTC+e -C$cpt -Bxf1000a2000+l"Relief Etopo1" -By+lm -I -V
gmt end

rm *.info gmt.conf *.int