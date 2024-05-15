set grd=c:/gridfiles/tw_topo500m.nc
gmt begin profile_B jpg A+m1.5c
    gmt grdtrack trackB.xyp -G%grd% | gawk "{ print $3, $4 }" > trackB.d
    echo 236.931 -5000 >> trackB.d
    echo 0 -5000 >> trackB.d 
    gmt plot trackB.d -R0/237/-4500/1000 -JX6.3i/1.4i -L -G0 -W1p -Bxa50f10+ukm -Bya1000f500+lElev+um -BWNse+tProfile_BB' -V
    echo -20 2000 16 5 W | gmt text -R0/237/-4500/1000 -JX -F+f+j -V -N
    echo 240 2000 16 5 E | gmt text -R0/237/-4500/1000 -JX -F+f+j -V -N
	gawk "{ print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13 }" focal4.txt > focal4.gmt
    gmt coupe focal4.gmt -Sc0.6c -Aa120/20.4/122.25/20.7/90/20/0/200 -G237/28/36 -E255 -JX6.3i/5i -R0/237/-200/0 ^
	-Bxa50f10+lDistance+ukm -Bya50f10+lDepth+um -BWSe -Y-5i -V
gmt end
pause