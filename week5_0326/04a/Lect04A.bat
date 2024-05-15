REM 3-D View of Bathymetry and Topography near Taiwan
REM Batch file to create Postscript plot of gridded data using GMT 
REM Batch file modified by Jyr-Ching Hu, Department of Geosciences, National Taiwan University
REM DOS prompt: del, pause
REM gmt programs: gemtset, grdgradient, grd2cpt, grdview, psxyz, colorbar, text
REM data source: @earth_relief_15s remote downloading from GMT server
@ECHO OFF
set prefix=Lect04A
set range1=117/125/18/27
set range2=117/125/18/27/-10000/4000
set grd=tw_relief_15s.nc

gmt gmtset MAP_ORIGIN_X 1.9i MAP_ORIGIN_Y 1.8i
gmt gmtset PROJ_LENGTH_UNIT inch
gmt gmtset FORMAT_GEO_MAP ddd:mm:ssF
gmt gmtset MAP_FRAME_TYPE Plain

gmt grdcut @earth_relief_15s -R%range1% -G%grd%

gmt begin %prefix% jpg A+m0.5c
    gmt grd2cpt %grd% -Crainbow -Z 
    gmt grdview %grd% -Jm121/23/0.6 -Jz0.0001 -C -I+a30+ne0.8 -R%range2% -p150/40 -Qi -N-10001+g200 -Bx1 -By1 -Bz2500+l"m" -BSEwnz -Y1.5 -X0.5
    gmt coast -Jz -p150/40/0 -Df -W0.5
	gmt colorbar -Dx0.0c/-1.5c+w15c/0.25c+h+e -I -Bx1000 -By+lm -V  
    echo 126.0 26.00 24,32 -22 TC 3D Relief of Taiwan Area | gmt text -F+f+a+j -N 
    echo 119.40 21.70 15,20,255 0 CB South China Sea > whiteword.txt
    echo 119.40 21.30 15,20,255 0 CB Basin >> whiteword.txt
    echo 123.50 19.05 13,20,255 50 LT West Philippine Basin >> whiteword.txt
    echo 119.40 20.50 15,20,255 30 LT Manila Trench >> whiteword.txt
    echo 123.40 21.20 10,20,255 50 LT Huatang Basin >> whiteword.txt
    echo 125.87 21.63 10,20,255 340 CB Ryukyu Trench >> whiteword.txt
    echo 126.50 23.70 15,20,255 0 CB Okinawa  >> whiteword.txt
    echo 126.80 23.45 15,20,255 0 CB Trough >> whiteword.txt
    echo 122.80 24.50 17,20,255 15 CB Taiwan Strait >> whiteword.txt
    gmt text whiteword.txt -Jz -F+f+a+j -N 
    echo 122.00 25.90 20,20 0 CB China > region.txt 
    echo 126.20 22.90 15,20 0 CB Ryukyu Arc >> region.txt
    echo 122.23 21.50 15,20 50 CB Luzon Arc >> region.txt
    echo 121.90 23.70 10,20 0 CB Penghu >> region.txt
    echo 121.88 23.45 10,20 0 CB Islands >> region.txt
    echo 123.20 22.80 10,20 0 CB Lutao >> region.txt
    echo 123.00 22.43 10,20 0 CB Lanyu >> region.txt
    gmt text region.txt -Jz -F+f+a+j -N 
    echo 123.36 23.70 15,20,255 0 CB Taiwan | gmt text -F+f+a+j -G150 -W0.3 -N
gmt end

del  *.conf
del whiteword.txt, region.txt
pause
