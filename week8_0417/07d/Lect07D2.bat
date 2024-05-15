REM This is an example for transparency
REM Coseismic deformation induced by 2020 Earthquake
REM set variables
set grd=C:\gridfiles\GEBCO_2019.nc
set InSAR=phasefilt_ll.nc
set topo=temp.grd
set prefix=Lect07D2
set cpt1=topo_gray.cpt
set cpt2=interferogram.cpt
REM configuring
gmt set FORMAT_GEO_MAP=ddd:mm:ssG
gmt set FONT_TITLE=36p,27,black
gmt set FONT_TAG=36p,27,black
REM cut grd
gmt grdcut %grd% -R%InSAR% -G%topo% -V
gmt grdinfo %topo% -V
REM create cpt
gmt makecpt -Cgray -T0/4000/500 -I -N > %cpt1% -V
gmt makecpt -Cjet -T-3.14/3.14 -Ww >%cpt2% -V
REM
gmt begin %prefix% jpg A+m0.5c
    
    gmt subplot begin 2x2 -Fs9.0i/12.0i -A(a)+jTL+o0.2c/0.2c -M5p 
	gmt subplot set 0
	    gmt basemap -JX? -R%InSAR% -Bxa1f0.5 -Bya1f0.5 -B+t"No transparency" -V
		gmt grdimage %topo% -C%cpt1% -I+a45+ne1.0 -V
		gmt grdimage %InSAR% -C%cpt2% -Q -V
		gmt colorbar -DjMB+jCM+o0.0i/-0.7i+w8.0i/0.25i+h -C%cpt2% -Bxa1f0.5+l"Phase" -V
		gmt subplot set 1
	    gmt basemap -JX? -R%InSAR% -Bxa1f0.5 -Bya1f0.5 -B+t"30%% transparency" -V
		gmt grdimage %topo% -C%cpt1% -I+a45+ne1.0 -V
		gmt grdimage %InSAR% -C%cpt2% -Q -t30 -V
		gmt colorbar -DjMB+jCM+o0.0i/-0.7i+w8.0i/0.25i+h -C%cpt2% -Bxa1f0.5+l"Phase" -V
	gmt subplot set 2
	    gmt basemap -JX? -R%InSAR% -Bxa1f0.5 -Bya1f0.5 -B+t"50%% transparency" -V
		gmt grdimage %topo% -C%cpt1% -I+a45+ne1.0 -V
		gmt grdimage %InSAR% -C%cpt2% -Q -t50 -V
		gmt colorbar -DjMB+jCM+o0.0i/-0.7i+w8.0i/0.25i+h -C%cpt2% -Bxa1f0.5+l"Phase" -V
    gmt subplot set 3
	    gmt basemap -JX? -R%InSAR% -Bxa1f0.5 -Bya1f0.5 -B+t"70%% transparency" -V
		gmt grdimage %topo% -C%cpt1% -I+a45+ne1.0 -V
		gmt grdimage %InSAR% -C%cpt2% -Q -t70 -V
		gmt colorbar -DjMB+jCM+o0.0i/-0.7i+w8.0i/0.25i+h -C%cpt2% -Bxa1f0.5+l"Phase" -V
	gmt subplot end
gmt end

del temp.grd *.conf *.history phase.cpt

pause