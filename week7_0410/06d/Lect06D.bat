REM P-axis and T axis of focal mechanism
REM Original batch file was made by Chu Han-Jian, Department of Geosciences, NTU
REM Batch file modified by Hu Jyr-Ching, Department of Geosciences, NTU 
 
set prefix=Lect06D
set range=121/124/21.5/25.5
set grd=c:/gridfiles/tw_topo500m.nc

gmt set MAP_ORIGIN_X 1i MAP_ORIGIN_Y 2i
gmt set FORMAT_GEO_MAP ddd:mm:ssG 

gmt begin %prefix% jpg A+m0.5c
rem ====== Make Basemap =====
	gmt grd2cpt %grd% -Csealand -L-8000/4000 -T-8000/4000/500 -V
	gmt grdimage %grd% -R%range% -JM121/15c -I+d  -X3c -V
	gmt coast -Df -Bxa1f0.5 -Bya1f0.5 -W1 -V

rem ====== Make countours =====
	gmt grdcontour %grd% -L-8000/-500 -C500 -A1000 -Wa1p,25 -Wc0.5p,100 -S80 -V
	gmt grdcontour %grd% -L500/4000 -C500 -Wc0.5p,50 -S20 -V

rem ====== Draw focal mechanisms =====
	gawk "{print $1, $2, $3, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15}" eq_tw_gcmt.txt > eq_m65.txt 
	gmt meca eq_m65.txt -Sc0.3i -Fa0.1c/c -C1p+s0.1p -h1 -N -V

rem ====== Draw scale bar =====
	gmt colorbar -Dx0.1i/-0.5i+w6i/0.15i+h+e -Bx1000 -By+lm -I -V

gmt end

del *.conf *.history
pause

