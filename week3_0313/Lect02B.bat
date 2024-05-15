REM  Ex01a Bathymetry and Topography in and around Taiwan
REM  Batch file to create Postscript plot of gridded data using GMT 
REM  Version 6.0.0 utilities 
REM  Created by Jyr-Ching Hu, Department of Geosciences, National Taiwan University
REM  DOS prompt: del, pause
REM  gmt programs: gmtset, bsemap, grdgrdient, grdimage, coast
REM  Data source: tw_topo500m.nc. Courtesy of National Center for Ocean Research (NOCR)

set prefix=Lect02B
set grd=tw_relief_15s.nc
set int=tw_relief_15s.nc.int
set cpt=my1st.cpt
set range=118.5/123.5/21/26
gmt set PS_MEDIA = letter
gmt get PS_MEDIA
gmt get MAP_FRAME_TYPE
gmt get FORMAT_GEO_MAP

echo Making color pallete table file,
echo -5695.33   255	 0	 255	-5178.35	 255    0  255   > my1st.cpt
echo -5178.35   113	 0	 255	-4068.62	 113    0  255   >> my1st.cpt
echo -4068.62	0	 28	 255	-3268.42	   0    28  255  >> my1st.cpt
echo -3268.42	0	170	 255	-2584.7	       0   170  255  >> my1st.cpt
echo -2584.7	0	255	 199	-1945.62	   0   255  199  >> my1st.cpt
echo -1945.62	0	255	 56	    -1306.54	   0   255   56  >> my1st.cpt
echo -1306.54	85	255	 0	    -622.809      85   255	 0   >> my1st.cpt
echo -622.809	227	255	 0	     177.383	 227   255	 0   >> my1st.cpt
echo 177.383	255	142	 0	     1287.11	 255   142	 0   >> my1st.cpt
echo 1287.11	255	0	 0	     3914.98	 255	 0	 0   >> my1st.cpt 
echo B	0	0	0 >> my1st.cpt
echo F	255	255	255 >> my1st.cpt
echo N	128	128	128>> my1st.cpt  

echo grdcut, extract subregion from a grid (earth_relief_15s.nc, remote downloading)
gmt grdcut @earth_relief_15s -R%range% -G%grd%
echo gridinfo, extract information from netCDF grid file 
gmt grdinfo %grd% > tw_relief_15s.nc.info
type tw_relief_15s.nc.info

gmt begin %prefix% ps,png,pdf A+m0.5c E400
  echo Compute gradient of grid, intensity file
  gmt grdgradient %grd% -A10/100 -G%int% -Ne1 -fg -V
  echo grdimage, shading
  gmt grdimage %grd% -Jm121/23/3c -R%range%  -C%cpt% -I%int% -V 
  gmt coast -Df -Ba1f0.5 -W1p,black -Tdg122.5/25.5+w1.5c+f2 ^
  --MAP_FRAME_TYPE=fancy -V  
gmt end

REM gmt psconvert %prefix% -Tt -A0.5i -E400
del %int%
pause