REM example for cyclic cpt from Bao-Han Tsao
REM Using grdmath to create a hypot function for cyclic cpt
REM set variables
set range=-20/20/-20/20
set grd=hypotenuse.nc
set prefix=Lect07C
REM conf
gmt set FONT_TITLE=20p,28,black
REM create grd grd
gmt grdmath -R%range% -I0.1 X Y HYPOT = %grd% -V
gmt grdinfo %grd% -V
REM create 4 cpt files
gmt makecpt -Chawaii -T0/20/0.4 -V > 01.cpt
gmt makecpt -Chawaii -T0/5/0.1 -V > 02.cpt
gmt makecpt -Chawaii -T0/20/0.4 -W -V > 03.cpt
gmt makecpt -Chawaii -T0/5/0.1 -Ww -V > 04.cpt
REM 
gmt begin %prefix% jpg A+m0.5c
    gmt subplot begin 2x2 -Fs4.0i/4.0i -A -M0.65i
	REM ordinary one
	gmt grdimage %grd% -R%range% -JX? -C01.cpt -Ba5f1.0 -BWStr+t"z(x,y) = (x@+2@+\053y@+2@+)@+1/2@+" -V -c
	REM gmt colorbar -DjMB+jCM+o0.0i/-0.5i+w4.0i/0.25i+h -C01.cpt -Bxa5f1 -V
	gmt colorbar -Dx-0.25c/-1.8c+w4.0i/0.25i+h -C01.cpt -Bxa5f1 -V
	REM cpt with small range
	gmt grdimage %grd% -R%range% -JX? -C02.cpt -Ba5f1.0 -BWStr+t"CPT with smaller range" -V -c
	REM gmt colorbar -DjMB+jCM+o0.0i/-0.5i+w4.0i/0.25i+h -C02.cpt -Bxa1f0.2 -V
	gmt colorbar -Dx-0.25c/-1.8c+w4.0i/0.25i+h -C02.cpt -Bxa1f0.2 -V
	REM -W cpt
	gmt grdimage %grd% -R%range% -JX? -C03.cpt -Ba5f1.0 -BWStr+t"-W CPT" -V -c
	REM gmt colorbar -DjMB+jCM+o0.0i/-0.5i+w4.0i/0.25i+h -C03.cpt -Bxa5f1 -V
	gmt colorbar -Dx-0.25c/-1.8c+w4.0i/0.25i+h -C03.cpt -Bxa5f1 -V
	REM -Ww cpt
	gmt grdimage %grd% -R%range% -JX? -C04.cpt -Ba5f1.0 -BWStr+t"-Ww CPT" -V -c
	REM gmt colorbar -DjMB+jCM+o0.0i/-0.5i+w4.0i/0.25i+h -C04.cpt -Bxa1f0.2 -V
	gmt colorbar -Dx-0.25c/-1.8c+w4.0i/0.25i+h -C04.cpt -Bxa1f0.2 -V
	gmt subplot end
gmt end
del *.conf *.history
pause