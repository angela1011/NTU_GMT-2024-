# Taiwan 20m DEM
# Original batch file was made by Ying-Ping Kuo, Department of Geosciences, NTU
# Shell script modified by Jyr-Ching Hu, Department of Geosciences, NTU
# Edited bu Bo-Han Tsao, Department of Geosciences, NTU for GMT6.0 and GMT6.3.0

# set variables
prefix=Lect09B
topo=../gridfiles/TW_20m_WGS84.nc
GPS=cGPS-2018_S01R.gmt
range=120/120.8/22.5/23
# configuration
gmt gmtset PROJ_LENGTH_UNIT=inch
gmt gmtset FORMAT_GEO_MAP=ddd:mm:ssF 
gmt gmtset MAP_FRAME_WIDTH=0.2c MAP_FRAME_TYPE=fancy+
gmt gmtset FONT_TITLE=12p,Helvetica,black FONT_LABEL=12p
# data processing
awk '{print $2, $3, sqrt($4*$4+$5*$5) }' $GPS | gmt blockmean -R$range -I0.01 > GPS.xy
gmt surface GPS.xy -R$range -T0.05 -I0.01 -GGPS.grd -V
# make topo shade file1
gmt grdgradient $topo -A300 -Gtemp_shade.nc -Ne0.5 -V
gmt grdcut temp_shade.nc -RGPS.grd -Gtemp_cut.nc
gmt grdsample GPS.grd -Rtemp_cut.nc -GGPS_temp.grd -V
# make cpt file
gmt makecpt -Crainbow -T0.68/75/0.1 -V  > velocity.cpt
gmt makecpt -Cvelocity.cpt -A50 -V > velocity50.cpt

# read gps grd info
gmt grdinfo GPS.grd > GPS.info
cat GPS.info

# gmt plot
gmt begin $prefix tif,png A+m0.5c
    # create basemap
    gmt basemap -Bxa0.2f0.1 -Bya0.2f0.1 -BwESn -R$range -JM121.0/7.5 -V
	# gmt draw inland image
    gmt coast -Gc -Df -V
	gmt grdimage GPS_temp.grd -Cvelocity50.cpt -Itemp_cut.nc -V
	gmt coast -Q -V
    # ======= Transportation network  ==================== 
    gmt plot Freeway_Nat.gmt -W2p,peachpuff4
    gmt plot TRA.gmt -W4p,black
    gmt plot TRA.gmt -W2.5p,white,4_4:2p
    gmt plot THSRC.gmt -W4p,black
    gmt plot THSRC.gmt -W2.5p,255/128/0,6_6:3p
    # ======= Plot shore line and faults  ==================== 
    gmt coast -Df -W0.8p,0
    gmt plot CGS_act_F_2010_84.txt -W2.2p,220/0/0
    gmt plot lungchuan.txt -W2.2p,220/0/0
    # ======= Plot GPS velocity field  ==================== 
    awk '{print $2, $3, $4, $5, 0, 0, 0 }' $GPS |gmt velo -Se.018/0.95/0 -A0.12i+a30+e -W1p,black -Gblack -h1 -V
	# ====== Add colorbar ==========
    gmt colorbar -Cvelocity50.cpt -Dx0.1/0.6+w2.0/0.12+h -N -Bx10+l"horizontal velocity(mm/yr)" -V
	# ====== Add inset map ========
	gmt inset begin -Dg120.05/23.0+w2.0/2.0+jTR+o0.75/0.25
	    gmt coast -R119.5/123.5/21.0/25.5 -JM121.0/? -G200 -Sazure -W0.1p,black -Btblr --MAP_FRAME_TYPE=plain
		echo 120 22.5 120.8 23 | gmt plot -Sr+s -W1p,red -V
	gmt inset end
	# ===== Add legend =========
	echo 120.05 22.63 40 0 0 0 0 | gmt velo -Se.018/0.95/0 -A0.12i+a30+e -W1p,black -Gblack -V
	echo 120.05 22.63 40 mm/yr | gmt text -F+f12p,0,black+jML -D0.0c/-0.5c -V
	
	gmt inset begin -Dg120.05/22.6+w2.0/2.0+jMR+o0.75/0.25
	    echo 0.0 0.0 4.0 6.0 | gmt plot -R0/4/0/6 -JX? -Sr+s -W0.25p,black -Gazure -V --MAP_FRAME_TYPE=plain
		echo 1.0 4.8 | gmt plot -S-0.5 -W2p,peachpuff4
		echo 3.0 4.8 Freeway | gmt text -F+f12p,6,black -V
		echo 1.0 3.6 | gmt plot -S-0.5 -W4p,black
		echo 1.0 3.6 | gmt plot -S-0.5 -W2.5p,white,4_4:2p
		echo 3.0 3.6 TRA | gmt text -F+f12p,6,black -V
		echo 1.0 2.4 | gmt plot -S-0.5 -W4p,black
		echo 1.0 2.4 | gmt plot -S-0.5 -W2.5p,255/128/0,6_6:3p
		echo 3.0 2.4 THSRC | gmt text -F+f12p,6,black -V
		echo 1.0 1.2 | gmt plot -S-0.5 -W2.2p,220/0/0
		echo 3.0 1.2 Fault | gmt text -F+f12p,6,black -V
	gmt inset end
gmt end
# Delete
rm *temp* *.history *.conf




