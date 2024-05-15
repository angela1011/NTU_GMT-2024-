REM Taiwan drainge system
REM Jyr-Ching Hu, GMT 6.0.0

set prefix=Lect05C3
set grd=c:/gridfiles/tw30m_aster.nc
set range1=119.6/122.4/21.6/25.4
set range2=121.3/122.1/24.6/25.35
set cpt=tw_gray.cpt

REM gmt set FONT_LABEL 10p MAP_ANNOT_OFFSET_PRIMARY 0.075i MAP_LABEL_OFFSET 0.085i MAP_FRAME_WIDTH 0.045i MAP_TICK_LENGTH_PRIMARY 0.080i

gmt makecpt -Cgray -T0/4000/500 -I -Z > %cpt%

gmt begin %prefix% jpg A+m0.5c
gmt subplot begin 1x2 -Fs15c/15c -A+JTL -M0
	gmt subplot set 0,0 -Ce2c
	REM make basemap 
	gmt basemap -JM121/23? -R%range1% -Ba1f0.5 -BWeSn+t"Drainage System in Taiwan" --FONT_TITLE=18p,16,blue --MAP_TITLE_OFFSET=2p -V
	gmt grdimage %grd% -C%cpt% -I+d -V
	gmt plot Taiwan_county_WGS84.gmt -W0.3p,azure -V
	gmt colorbar -C%cpt% -DJRM+o0.6i/0+e+mc -By+l"m" -Bx+l"Elevation" -V

	REM Draw river dataset
	gmt plot river_WGS84.gmt -W0.5p,deepskyblue -V
	gmt coast -Df -W0.3p,0 -Slightcyan -V
	REM Draw red rectangle
	echo 121.3 24.6 122.1 25.35 | gmt plot -Sr+s -W2p,red -V

	gmt subplot set 0,1 
	REM Draw mainstream & tributary in a cut region
	gmt basemap -R%range2% -JM121.7? -BwESn -Ba0.4f0.2 -V
	gmt grdimage %grd% -C%cpt%  -I+d -V
	gmt coast -Df -W1p -Slightcyan -V
	gmt plot river_WGS84.gmt -W0.5p,deepskyblue -V
	gmt subplot end
gmt end
del  gmt.conf
pause