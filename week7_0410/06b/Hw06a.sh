gmt set FORMAT_GEO_MAP ddd:mm:ssG

prefix=Hw06a
range=119/123/21/26
grd1=../grdfiles/tw80m.nc
grd2=../grdfiles/Taidp200m.nc
data=AS_TS.txt 
int1=tw30m_aster.nc.in
int2=Taidp200m.nc.int
cpt1=fpcolor.cpt

# ======= Plot a basemap =======
gmt begin $prefix jpg A+m0.5c
	gmt basemap -R$range -JM121/15c -Ba1f0.5 -BWeSn -V -U
	gmt grdimage $grd2 -CGray  -I+d -V
	
    # ======= Using gmt pscoast to clip dry area and fill in 30 m DEM =======
	gmt coast -Df -Gc -V
    gmt grdimage $grd1 -CGray -I+d -V
    gmt coast -Q -V
    gmt coast -Df -W0.5p,black -V
	
	echo 120.0 21.2 | gmt plot -Sc0.5c -G255/0/0 -W0.1p -Y-2.1c -V
	echo 120.4 21.2 | gmt plot -Sc0.5c -G255/130/0 -W0.1p -V
	echo 120.8 21.2 | gmt plot -Sc0.5c -G255/255/0 -W0.1p -V
	echo 121.2 21.2 | gmt plot -Sc0.5c -G0/255/0 -W0.1p -V
	echo 121.6 21.2 | gmt plot -Sc0.5c -G0/255/255 -W0.1p -V
	echo 122.0 21.2 | gmt plot -Sc0.5c -G0/0/255 -W0.1p -V

	echo 120.0 21.2 '0-10' | gmt text -W0.1p -F+f,Helvetica-Bold,black -Y-0.5c -V
	echo 120.4 21.2 '10-15' | gmt text -W0.1p -F+f,Helvetica-Bold,black 
	echo 120.8 21.2 '15-20' | gmt text -W0.1p -F+f,Helvetica-Bold,black 
	echo 121.2 21.2 '20-25' | gmt text -W0.1p -F+f,Helvetica-Bold,black 
	echo 121.6 21.2 '25-30' | gmt text -W0.1p -F+f,Helvetica-Bold,black 
	echo 122.0 21.2 '30up' | gmt text -W0.1p -F+f,Helvetica-Bold,black

	# ====== 1999 Sort by depth ===========
    awk '{ if ($3 < 10)  print $1, $2}' AS_TS.txt | gmt plot -C$cpt1 -Sc0.2 -W0.1p -V
    awk '{ if ($3 >= 10 && $3 < 15) print $1, $2, $3}' AS_TS.txt | gmt plot -C$cpt1 -Sc0.2 -W0.1p -V
    awk '{ if ($3 >= 15 && $3 < 20) print $1, $2, $3}' AS_TS.txt | gmt plot -C$cpt1 -Sc0.2 -W0.1p -V
    awk '{ if ($3 >= 20 && $3 < 25) print $1, $2, $3}' AS_TS.txt | gmt plot -C$cpt1 -Sc0.2 -W0.1p -V
    awk '{ if ($3 >= 25 && $3 < 20) print $1, $2, $3}' AS_TS.txt | gmt plot -C$cpt1 -Sc0.2 -W0.1p -V
    awk '{ if ($3 >= 30 ) print $1, $2, $3}' AS_TS.txt | gmt plot -C$cpt1 -Sc0.2 -W0.1p -W0.1p -V 
	
	# ======= Plot epicenters of earthquakes with star symbols =======
	# gmt plot AS_TS.txt -Sa0.2c $cpt -W0.1p -V

	# ======= Plot focal mechanisms with Aki and Richard convention Sa =======
 	# gmt meca AS_TS.txt -Sa0.8c+u -Zfd_gray+.cpt  -h1 -C0.1 -N -L -V
	# ======= Plot focal mechanisms with Harvard CMT seismic moment tensor convention Sm =======
 	# gmt meca AS_TS.txt -Sm0.8c+f8p+o3p -Zfd_gray+.cpt -C0.1 -h1 -N -L -V
	gmt meca AS_TS.txt -A+s0.2c -Sa1.3c -C -V

	# gmt meca AS_TS.txt -Sa0.3i+f8p+o2p -A -V
    # awk '{print $1, $2, $3*0.022}' AS_TS.txt | gmt plot -Sa -G0/0/0 -V

gmt end

rm *.conf 