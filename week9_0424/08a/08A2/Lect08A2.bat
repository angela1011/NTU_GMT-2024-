REM Bird2003_PB for Palu
REM Original batch file is frpm Hsiu-Fang Lee, Department of Geosciences, NTU
REM Edited by Bo_Han Tsao, Department of Geosciences, NTU for GMT6.0

REM
set prefix=Lect08A2
set range=105/145/-15/10
set grd=C:/gridfiles/GEBCO_2019.nc
set topo=cut.nc

REM sealand.cpt
REM cptfile1=NZ_blue+DEM.cpt

REM set range2=117/127/5/19
REM set grd2=@earth_relief_15s.grd  
REM set grd2-1=gebco_08.nc
REM set cptfile2=gray_topo.cpt

REM configure
gmt set PROJ_LENGTH_UNIT=inch
gmt set FORMAT_GEO_MAP=ddd:mm:ssG
gmt set PS_CHAR_ENCODING=Standard+

REM ====== Cut gridfile ========
gmt grdcut %grd% -R%range% -G%topo%
REM ====== gmt plot ========
gmt begin %prefix% jpg A+m0.5c
    gmt makecpt -Csealand -T-10000/5000/500
    gmt grdimage %topo% -Jm125.0/0.2 -R%range% -C -I+a0/90+nt1.0 -Ba5 -BWSen -V
    gmt coast -Df -W0.25p,0 -N1/0.5,20 -V
	gmt plot PB2002_boundaries.dig-2.txt -W2p,0/0/0 -V
    REM ===== PPB2002_steps.dat.txt =====
	gmt plot PB2002_steps.dat_CRB.txt -W2p,239/239/8    -l"CRB"+N2 -V
    :gmt plot PB2002_steps.dat_CRB.txt -W2p,239/239/8    -l"CRB"+n2 -V
	::The modifiers for -l option has changed in 6.3.0
    gmt plot PB2002_steps.dat_CTF.txt -W2p,206/107/74   -l"CTF" -V
    gmt plot PB2002_steps.dat_CCB.txt -W2p,123/123/123  -l"CCB" -V
    gmt plot PB2002_steps.dat_OSR.txt -W2p,255/0/49     -l"OSR" -V
    gmt plot PB2002_steps.dat_OTF.txt -W2p,0/123/49     -l"OTF" -V
    gmt plot PB2002_steps.dat_OCB.txt -W2p,255/173/214  -l"OCB" -V
    gmt plot PB2002_steps.dat_SUB.txt -W2p,41/173/206   -l"SUB" -V
    REM ======= Add legend ====================
	gmt legend -Dg145.0/-15.0+w4.5c+o0.0c/1.0c+jTR -F+p1p+gazure+s --FONT_ANNOT_PRIMARY=14p,7	
    REM add GPS
    gmt plot GPS_AndreaWalpersdorf_Table1.txt -St0.2c -Gred -W0.5,0 -V
    gmt velo GPS_AndreaWalpersdorf_Table1.txt -Se0.015/0.95+f0 -A0.15i+a30+e -W1.5,black -Gblack -V
    gawk "{ print $1, $2, $8 }" GPS_AndreaWalpersdorf_Table1.txt | gmt text -F+f8p,0,blue -D0/-0.1 -V
    REM The MORVEL angular velocity for AU relative to SU 
	echo 118.000 -12.000 16.5 70.5 0 0 0.7557 1  | gmt velo -Se0.015/0.95+f0 -A0.3i+a30+e -W6p,red -Gred -V
    echo 118.000 -12.000 72.4 mm/yr | gmt text -F+f16p,7,red+jMC -D0.0/-0.1 -V
    REM The MORVEL angular velocity for PS relative to SU 
    echo 131.000 2.500 -99.2 38.6 0 0 0.2300 1 | gmt velo -Se.015/0.65+f0 -A0.3i+a30+e -W6p,red -Gred -V
    echo 131.000 2.500 106.4 mm/yr | gmt text -F+f16p,7,red+jMC -D0.0/-0.1 -V
    REM add velo symbol
    echo 128.000 -18.000 40 0 2	2 0 1 | gmt velo -Se.015/0.95+f0 -A0.15i+a30+e -W1.5,black -N -V
	echo 128.000 -19.000 40\2342 mm/yr | gmt text -F+f16p,7+jML -N -V
	REM add plate label
	echo 140.0 -13.0 AU > plate_temp
	echo 115.0 -3.0 SU >> plate_temp
	echo 122.0 -10.0 TI >> plate_temp
	echo 130.0 -5.0  BS >> plate_temp
	echo 130.0 -1.0 BH >> plate_temp
	echo 124.0 -2.0 MS >> plate_temp
	echo 130.0 8.0 PS >> plate_temp
	echo 138.0 5.0 CL >> plate_temp
	echo 148.0 9.0 PA >> plate_temp
	echo 138.0 -1.0 MO >> plate_temp
	echo 143.0 -5.0 WL >> plate_temp
	echo 144.0 -1.0 NB >> plate_temp
	gmt text plate_temp -F+f16p,1,black=0.5p,white,solid+jCM -V
    REM add colorbar
    gmt colorbar -C -Dx0/-0.6+w4.0/0.25+jBL+h+e -S -Ba2000f1000+l"Relief(m)" -I -V
gmt end
REM finale
pause