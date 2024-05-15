::configure 
set prefix=Lect06E
set range=119/122.5/20/23
set grd=C:/gridfiles/tw_topo500m.nc
set cpt=topo_wiki-2.0.cpt
REM gmt set PROJ_LENGTH_UNIT=inch

set startA=120/20.2
set endA=122.25/20.5
set startB=120/20.4
set endB=122.25/20.75
set startC=120/20.6
set endC=122.25/21.25
set startD=120/20.8
set endD=122.25/21.5
set startE=119.9/21
set endE=122.25/21.75
set startF=119.8/21.2
set endF=122.15/21.95
set startG=119.65/21.4 
set endG=121.5/22

gmt makecpt -Cseis -T0/200/5 -Z -V > fd_seis.cpt
gmt makecpt -Cseis -T-200/0/5 -I -Z -V > fd_seis+.cpt
gmt makecpt -Cwiki-2.0.cpt -T-6000/4000/200  > %cpt%
REM plot
gmt begin %prefix% jpg A+m0.5c
    gmt makecpt -Cwiki-2.0.cpt -T-6000/4000 -Z
    gmt basemap -R%range% -JM11/15c -Bxa1f0.5 -Bya1f0.5 -BWeSn+t"Seismicity offshore southern Taiwan" -V
	gmt grdimage %grd% -C%cpt% -I+d -V
    gmt coast -Dh -W0.5,0 -Lg119.6/22.8+c23.5+w100k+l+f -V
    gmt colorbar -C%cpt% -Dx0i/-0.5i+w6i/0.15i+h -Bx1000f200g200+l"Topography and Bathymetry" -By+lm -V
    
    REM Plot focal mechanism (Data: Global CMT)
    
    gmt meca fm_sm.txt -Sm0.2i+f10p -Cfd_seis.cpt -A -N -L -V
    gmt plot fm_sm.txt -Sa0.15i -G244/154/193 -W0.2,255 -V
    gmt colorbar -Cfd_seis+.cpt -Dx-0.8i/0.5i+w4.5i/0.15i+m -Bx50f10+l"Focal Depth" -By+lkm -V -I
      
    REM plot track A-G
    gmt project -C%startA% -E%endA% -G.5 -Q > trackA.xyp 
    gmt plot trackA.xyp -R%range% -JM -W2p,13/0/76 
    gmt project -C%startB% -E%endB% -G.5 -Q > trackB.xyp
    gmt plot trackB.xyp -R%range% -JM -W2p,13/0/76
    gmt project -C%startC% -E%endC% -G.5 -Q > trackC.xyp
    gmt plot trackC.xyp -R%range% -JM -W2p,13/0/76
    gmt project -C%startD%  -E%endD% -G.5 -Q > trackD.xyp
    gmt plot trackD.xyp -R%range% -JM -W2p,13/0/76
    gmt project -C%startE% -E%endE% -G.5 -Q > trackE.xyp
    gmt plot trackE.xyp -R%range% -JM -W2p,13/0/76
    gmt project -C%startF% -E%endF% -G.5 -Q > trackF.xyp
    gmt plot trackF.xyp -R%range% -JM -W2p,13/0/76
    gmt project -C%startG% -E%endG% -G.5 -Q > trackG.xyp
    gmt plot trackG.xyp -R%range% -JM -W2p,13/0/76
    gawk "{ print $1, $2, $3, $6, $7 }" aa.txt > aa2.txt
    gmt text aa2.txt -F+f+j
gmt end

REM plot topography & focal mechanisms along cross section AA'
set C:\gridfiles\tw_topo500m.nc
gmt begin profile_A jpg A+m1.5c
    gmt grdtrack trackA.xyp -G%grd% | gawk "{ print $3, $4 }" > trackA.d
    echo 236.931 -5000 >> trackA.d
    echo 0 -5000 >> trackA.d 
    gmt plot trackA.d -R0/237/-4500/1000 -JX6.3i/1.4i -L -G0 -W1p -Bxa50f10+ukm -Bya1000f500+lElev+um -BWNse+tProfile_AA' -V
    echo -20 2000 16 5 W | gmt text -R0/237/-4500/1000 -JX -F+f+j -V -N
    echo 240 2000 16 5 E | gmt text -R0/237/-4500/1000 -JX -F+f+j -V -N
	gawk "{ print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13 }" focal4.txt > focal4.gmt
    gmt coupe focal4.gmt -Sc0.6c -Aa120/20.2/122.25/20.5/90/20/0/200 -G237/28/36 -E255 -JX6.3i/5i -R0/237/-200/0 ^
	-Bxa50f10+lDistance+ukm -Bya50f10+lDepth+um -BWSe -Y-5i -V
gmt end

REM plot topography & focal mechanisms along cross section BB'
set set C:\gridfiles\tw_topo500m.nc
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

REM plot topography & focal mechanisms along cross section CC'
set set C:\gridfiles\tw_topo500m.nc
gmt begin profile_C jpg A+m1.5c
    gmt grdtrack trackC.xyp -G%grd% | gawk "{ print $3, $4 }" > trackC.d
    echo 236.931 -5000 >> trackC.d
    echo 0 -5000 >> trackC.d 
    gmt plot trackC.d -R0/237/-4500/1000 -JX6.3i/1.4i -L -G0 -W1p -Bxa50f10+ukm -Bya1000f500+lElev+um -BWNse+tProfile_CC' -V
    echo -20 2000 16 5 W | gmt text -R0/237/-4500/1000 -JX -F+f+j -V -N
    echo 240 2000 16 5 E | gmt text -R0/237/-4500/1000 -JX -F+f+j -V -N
	gawk "{ print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13 }" focal4.txt > focal4.gmt
    gmt coupe focal4.gmt -Sc0.6c -Aa120/20.6/122.25/21.25/90/20/0/200 -G237/28/36 -E255 -JX6.3i/5i -R0/237/-200/0 ^
	-Bxa50f10+lDistance+ukm -Bya50f10+lDepth+um -BWSe -Y-5i -V
gmt end

REM plot topography & focal mechanisms along cross section DD'
set set C:\gridfiles\tw_topo500m.nc
gmt begin profile_D jpg A+m1.5c
    gmt grdtrack trackD.xyp -G%grd% | gawk "{ print $3, $4 }" > trackD.d
    echo 236.931 -5000 >> trackD.d
    echo 0 -5000 >> trackD.d 
    gmt plot trackD.d -R0/237/-4500/1000 -JX6.3i/1.4i -L -G0 -W1p -Bxa50f10+ukm -Bya1000f500+lElev+um -BWNse+tProfile_DD' -V
    echo -20 2000 16 5 W | gmt text -R0/237/-4500/1000 -JX -F+f+j -V -N
    echo 240 2000 16 5 E | gmt text -R0/237/-4500/1000 -JX -F+f+j -V -N
	gawk "{ print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13 }" focal4.txt > focal4.gmt
    gmt coupe focal4.gmt -Sc0.6c -Aa120/20.8/122.25/21.5/90/20/0/200 -G237/28/36 -E255 -JX6.3i/5i -R0/237/-200/0 ^
	-Bxa50f10+lDistance+ukm -Bya50f10+lDepth+um -BWSe -Y-5i -V
gmt end

REM plot topography & focal mechanisms along cross section EE'
set set C:\gridfiles\tw_topo500m.nc
gmt begin profile_E jpg A+m1.5c
    gmt grdtrack trackE.xyp -G%grd% | gawk "{ print $3, $4 }" > trackE.d
    echo 236.931 -5000 >> trackE.d
    echo 0 -5000 >> trackE.d 
    gmt plot trackE.d -R0/237/-4500/1000 -JX6.3i/1.4i -L -G0 -W1p -Bxa50f10+ukm -Bya1000f500+lElev+um -BWNse+tProfile_EE' -V
    echo -20 2000 16 5 W | gmt text -R0/237/-4500/1000 -JX -F+f+j -V -N
    echo 240 2000 16 5 E | gmt text -R0/237/-4500/1000 -JX -F+f+j -V -N
	gawk "{ print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13 }" focal4.txt > focal4.gmt
    gmt coupe focal4.gmt -Sc0.6c -Aa119.9/21/122.25/21.75/90/20/0/200 -G237/28/36 -E255 -JX6.3i/5i -R0/237/-200/0 ^
	-Bxa50f10+lDistance+ukm -Bya50f10+lDepth+um -BWSe -Y-5i -V
gmt end

REM plot topography & focal mechanisms along cross section FF'
set set C/gridfiles/tw_topo500m.nc
gmt begin profile_F jpg A+m1.5c
    gmt grdtrack trackF.xyp -G%grd% | gawk "{ print $3, $4 }" > trackF.d
    echo 236.931 -5000 >> trackF.d
    echo 0 -5000 >> trackF.d 
    gmt plot trackF.d -R0/237/-4500/1000 -JX6.3i/1.4i -L -G0 -W1p -Bxa50f10+ukm -Bya1000f500+lElev+um -BWNse+tProfile_FF' -V
    echo -20 2000 16 5 W | gmt text -R0/237/-4500/1000 -JX -F+f+j -V -N
    echo 240 2000 16 5 E | gmt text -R0/237/-4500/1000 -JX -F+f+j -V -N
	gawk "{ print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13 }" focal4.txt > focal4.gmt
    gmt coupe focal4.gmt -Sc0.6c -Aa119.8/21.2/122.15/21.95/90/20/0/200 -G237/28/36 -E255 -JX6.3i/5i -R0/237/-200/0 ^
	-Bxa50f10+lDistance+ukm -Bya50f10+lDepth+um -BWSe -Y-5i -V
gmt end

REM plot topography & focal mechanisms along cross section GG'
set set C:/gridfiles/tw_topo500m.nc
gmt begin profile_G jpg A+m1.5c
    gmt grdtrack trackG.xyp -G%grd% | gawk "{ print $3, $4 }" > trackG.d
    echo 236.931 -5000 >> trackG.d
    echo 0 -5000 >> trackG.d 
    gmt plot trackG.d -R0/237/-4500/1000 -JX6.3i/1.4i -L -G0 -W1p -Bxa50f10+ukm -Bya1000f500+lElev+um -BWNse+tProfile_GG' -V
    echo -20 2000 16 5 W | gmt text -R0/237/-4500/1000 -JX -F+f+j -V -N
    echo 240 2000 16 5 E | gmt text -R0/237/-4500/1000 -JX -F+f+j -V -N
	gawk "{ print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13 }" focal4.txt > focal4.gmt
    gmt coupe focal4.gmt -Sc0.6c -Aa119.65/21.4/121.5/22/90/20/0/200 -G237/28/36 -E255 -JX6.3i/5i -R0/237/-200/0 ^
	-Bxa50f10+lDistance+ukm -Bya50f10+lDepth+um -BWSe -Y-5i -V
gmt end

del Aa1* *.conf *.history *.d
pause