# set variables
prefix=EX01
grd=Taiwan40m_WGS84.nc
outgrd=tw_cent.nc
cpt=topo_gray.cpt
int=tw_cent.grd.int

x1=119.5
x2=121.999951803
y1=22.4998756634
y2=24.5000722922
range=${x1}/${x2}/${y1}/${y2}
start=121.25/23.90
end=120.35/24.22

# process data
gmt grdcut $grd -G$outgrd -R$range -V
gmt makecpt -Cgray -T0/4000/500 -I -N > topo_gray.cpt -V
gmt project -C120.40/24.20 -E121.15/23.90 -G.5 -Q > trackA
gmt project -C120.10/23.60 -E121.00/23.30 -G.5 -Q > trackD

gmt grdtrack track.A -G$outgrd | awk '{ print $3, $4 }' > trackA.xyp
echo 100 0 >> trackA.xyp
echo 0 0 >> trackA.xyp
gmt grdtrack track.D -G$outgrd | awk '{print $3, $4 }' > trackD.xyp                                                                            
echo 100 0 >> trackD.xyp                                                                                                            
echo 0 0 >> trackD.xyp
# plot
gmt begin $prefix png A+m0.5c
    gmt grdimage $outgrd -R119.5/122/22.5/24.5 -Jm121.0/1.5i -C$cpt -I+a60+ne1.0 -V 
	gmt coast -W1p,0 -S255/255/255 -Lg119.80/24.20+c15+w50+f+lkm -Bx1f0.5 -By1f0.5 -BWSne -Df -V
	# ****EQ classify with focal depth****
	awk '{print $1, $2, -$3, $4}' CWAEQs_1995-2022.txt > CWAEQs_1995-2022.gmt
    awk '{if ($3 >=  0 && $3 < 15) print $1, $2, $3, $4 }' CWAEQs_1995-2022.gmt > hypo_0_15.gmt
    awk '{if ($3 >= 15 && $3 < 30) print $1, $2, $3, $4 }' CWAEQs_1995-2022.gmt > hypo_15_30.gmt
    awk '{if ($3 >= 30 && $3 < 50) print $1, $2, $3, $4 }' CWBAQs_1995-2022.gmt > hypo_30_50.gmt
    awk '{if ($3 >= 50 ) print $1, $2, $3, $4 }' CWAEQs_1995-2022.gmt > hypo_50+.gmt
    
    awk '{print $1, $2, $4*0.01}' hypo_0_15.gmt  | gmt plot -Sc -W0.00008i,255/106/106 -V
    awk '{print $1, $2, $4*0.01}' hypo_15_30.gmt | gmt plot -Sc -W0.00008i,250/250/0 -V
    awk '{print $1, $2, $4*0.01}' hypo_30_50.gmt | gmt plot -Sc -W0.00008i,50/250/100  -V
    awk '{print $1, $2, $4*0.01}' hypo_50+.gmt  | gmt plot -Sc -W0.00008i,0/191/255 -V
	
	# ***** Basement high *****
	gmt plot basement_high.txt -W1p,0/0/150,- -V
	echo 119.75 23.90 10,1,0/0/150 MC Basement | gmt text -F+f+j -V
	echo 119.75 23.83 10,1,0/0/150 MC High | gmt text -F+f+j -V
	# ***profile - track & project***
    echo 120.35 24.22 12,1 MC A | gmt text -F+f+j -N -V
    echo "121.25 23.90 12,1 MC A'"| gmt text -F+f+j -N -V
    echo 120.05 23.62 12,1 MC D | gmt text -F+f+j -N -V
    echo "121.10 23.31 12,1 MC D'" | gmt text -F+f+j -N -V
    gmt plot EQ_2024_csv.txt -Sa0.5c -Gred -W0.1p -V
	
    gmt plot trackA -W2p,0 -V
    gmt plot trackD -W2p,0 -V
	
	# ****plot symbol, title ****
    echo 119.75 24.70 8,1 MC Depth | gmt text -F+f+j -N -V
    echo 120.00 24.70 8,1 MC  0-15 | gmt text -F+f+j -N -V
    echo 120.25 24.70 8,1 MC 15-30 | gmt text -F+f+j -N -V
    echo 120.50 24.70 8,1 MC 30-50 | gmt text -F+f+j -N -V
    echo 120.74 24.70 8,1 MC \076 50 | gmt text -F+f+j -N -V
    echo 120.90 24.70 8,1 MC km | gmt text -F+f+j -N -V
    echo 121.15 24.80 10,1 LM Projection width\072 | gmt text -F+f+j -N -V
    echo 121.15 24.69 10,1 LM 20 km '(each side)' | gmt text -F+f+j -N -V
    echo 120.75 24.95 16,1 MC Background seismicities of Taiwan | gmt text -F+f+j -N -V
	
	echo 120.00 24.78 | gmt plot -Sc.08i -W0.5p,255/106/106 -N  -V
    echo 120.25 24.78 | gmt plot -Sc.08i -W0.5p,250/250/0 -N -V
    echo 120.50 24.78 | gmt plot -Sc.08i -W0.5p,50/250/100 -N -V
    echo 120.74 24.78 | gmt plot -Sc.08i -W0.5p,0/191/255 -N -V
	gmt colorbar -C$cpt -Dx4.5c/-1c/8c/0.3ch -By+l'm' -Bxa1000f500+l"Elevation" -V
	
    # *****Plot strenghth profile based on seismicity*****
	# Line AA' profile & eq projection
    gmt plot trackA.xyp -R0/86/0/3000 -JX2.5i/0.6i -G127.5 -W1p -Bxa20f10+ukm -Bya1000f500+l"Elev (m)" -BWNbr+t"Profile AA'" -X5i -Y4.5i -V
	echo -15 3700 14 LB W | gmt text -F+f+j -N -V
	echo 87  3700 14 LB E | gmt text -F+f+j -N -V
	gmt coupe CWAEQs_1995-2022.txt -JX2.5i/1.5i -R0/86/-50/0 -Bxa20f10+l"Distance (Km)" -Bya10f5+l"Depth (km)" -BWStr -W0.5p \
	-Fsc0.04c/0 -Aa120.40/24.20/121.15/23.90/90/20/0/50 -Y-1.5i -V
	awk '{print -$3 }' Aa120.4_24.2_121.2_23.9_90_20_0_50 > Aa_a.txt
    gmt project -C$start -E$end -G1 -Q > track.xyp
    gmt grdtrack track.xyp -G$outgrd > track.xypz
    awk '{ print $3,$4 }' track.xypz > track_profile.txt
    gmt info track_profile.txt -I5 > minmax.out
    cat minmax.out

    gmt project -C$start -E$end -G1 -Q > track.xyp
    gmt grdtrack track.xyp -G$outgrd > track.xypz
    awk '{ print $3,$4 }' track.xypz > track_profile.txt
    gmt info track_profile.txt -I5 > minmax.out
    cat minmax.out
    gmt plot track_profile.txt -R0/100/0/2000 -JX2.5i/0.6i -G127.5 -W1p -Bxa20f10+ukm -Bya1000f500+l"Elev" -BWNbr+t"Profile AA'" -Y-2i -V
    gmt coupe CWAEQs_1995-2022.txt -JX2.5i/1.5i -R0/100/-200/0 -Bxa50f10+l"Distance (Km)" -Bya50f5+l"Depth" -BWStr -W0.5p \
	-Fsc0.04c/0 -Aa120.40/24.20/121.15/23.90/90/20/0/50 -Y-1.5i -Vi
    gawk '{print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13 }' EQ_2024_csv.txt > focal4.gmt
    gmt pcoupe focal4.gmt -Sc0.6c -Aa120.40/24.20/121.15/23.90/90/20/0/50 -G237/28/36 -E255 -JX6.3i/5i -R0/100/-200/0  \
    -Bxa50f10+l"Distance (Km)" -Bya50f5+l"Depth" -BWStr -W0.5p \
	-Fsc0.04c/0 -Aa120.40/24.20/121.15/23.90/90/20/0/50 -Y-1.5i -Vi
gmt end

# rm *.history *.conf *.nc
