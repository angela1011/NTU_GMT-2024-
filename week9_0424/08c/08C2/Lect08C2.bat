REM GPS derived rotation rate in southern Taiwan
REM Data: Central Geological Survey, MOEA, Taiwan
REM Origninal Batch file was made by Ching Kuo-En, Department of Geomatics, NCKU
REM Batch file modified by Hu Jyr-Ching, Department of Geosciences, NTU, 09/01/2007
REM Batch file modified by Bo-Han Tsao, Department of Geosciences, NTU, 30/04/2020
REM
REM set variables
set prefix=Lect08C2
set range=120.1/120.7/22.25/23.0
REM configure
gmt set PROJ_LENGTH_UNIT=inch
gmt set FONT_LABEL=11p MAP_ANNOT_OFFSET_PRIMARY=0.075i MAP_LABEL_OFFSET=0.085i FONT_LABEL=13p MAP_FRAME_WIDTH=0.045i MAP_TICK_LENGTH_PRIMARY=0.080i
gmt set PS_CHAR_ENCODING=Standard+
REM create gridfile for rotation
gawk "{print $1,$2,$3}" rot.gmt | gmt surface -R%range% -Grot.grd -I0.001 -T0.25 -C0.1
gmt grdsample swshad.grd -Rrot.grd -I0.001 -Gtemp.nc -V
REM
gmt begin %prefix% jpg A+m0.5c
    REM draw rotation image
	gmt grdimage rot.grd -Crot.cpt -Itemp.nc -R%range% -Jm121.0/10.5i -Ba0.2f0.2 -BWESN -V
    REM draw coast
	gmt coast -Df -W2p,0 -Lg120.185/22.48+c7.5+w15.0+f+lkm -S255 -V
	REM add faults
	gmt plot fault.dat -W3p,255 -V
	gmt plot inferred_fault_dash.dat -W2p,255,- -V
	gmt plot inferred_fault_1.dat -W2p,255 -V
	gmt plot cpc_fault.gmt -W2p,255 -V
	REM add text
	echo 120.297726 22.625529 Kaohsiung | gmt text -F+f10+a0+jMC -W1p,white -Gwhite -V
    echo 120.481930 22.667166 Pingtung | gmt text -F+f10+a0+jMC -W1p,white -Gwhite -V
    echo 120.42 22.34 Liuchiuyu | gmt text -F+f10+a0+jMC -Gwhite -W1p,white -V
    echo 120.603 22.60 CCUF | gmt text -F+f8+a86+jMC -W1p,white -Gwhite -V
    echo 120.455 22.88 CHNF | gmt text -F+f8+a49+jMC -W1p,white -Gwhite -V
    echo 120.215 22.97 HCLF | gmt text -F+f8+a75+jMC -W1p,white -Gwhite -V
    echo 120.300 22.85 HKSF | gmt text -F+f8+a80+jMC -W1p,white -Gwhite -V
    echo 120.326 22.718 FTFZ | gmt text -F+f8+a-55+jMC -W1p,white -Gwhite -V
    echo 120.250 22.950 CCF | gmt text -F+f8+a75+jMC -W1p,white -Gwhite -V
    echo 120.310 22.920 MLF | gmt text -F+f8+a85+jMC -W1p,white -Gwhite -V
    echo 120.409 22.960 LCF | gmt text -F+f8+a74+jMC -W1p,white -Gwhite -V
    echo 120.385 22.909 GTKF | gmt text -F+f8+a45+jMC -W1p,white -Gwhite -V
    echo 120.452 22.959 PCF | gmt text -F+f8+a75+jMC -W1p,white -Gwhite -V
    echo 120.68 22.58 (A) | gmt text -F+f15+a0+jMC -W1p,white -Gwhite -V
    echo 120.53 22.73 (B) | gmt text -F+f15+a0+jMC -W1p,white -Gwhite -V
    echo 120.37 22.98 (C) | gmt text -F+f15+a0+jMC -W1p,white -Gwhite -V
	echo 120.145 22.97(c)| gmt text -F+f25p,1+jMC -V
	REM draw rotation
	gmt velo rot_p.gmt -Sw0.3i/1.2e6 -W1p,0/0/0 -G150 -V
    gmt velo rot_n.gmt -Sw0.3i/1.2e6 -W1p,0/0/0 -Gwhite -V
	REM draw gps station
	gmt plot velh.gmt -St.06 -W2p,0/0/0 -G255 -h1 -V
	REM add symbol
	echo 120.16 22.57 -0.698e-06 0 | gmt velo -Sw0.3i/1.2e6 -W1p,0/0/0 -G255/255/255 -V
    echo 120.14 22.535 0.698e-06 0 |gmt velo -Sw0.3i/1.2e6 -W1p,0/0/0 -G150/150/150 -V
    echo 120.17 22.585 Anticlockwise | gmt text -F+f10p,Helvetica+jML -V
    echo 120.17 22.545 Clockwise | gmt text -F+f10p,Helvetica+jML -V
    echo 120.17 22.52 40.0\217/Myr | gmt text -F+f10p,Helvetica+jML -V
	REM add colorbar
	gmt colorbar -Bx0.5+l"\225strain/yr" -Dx3.14i/0.7i+w2.0i/0.10i+h -I0.5 -Crot_scale.cpt -V
	REM inset
	gmt inset begin -DjBL+w1.5i/1.5i+o0.1i/0.1i -M0.002i
	    gmt coast -W0.25p,0 -JM? -R119.5/122.5/21.6/25.5 -Glightgreen -Sazure -Btblr --MAP_FRAME_TYPE=plain -V
		echo 120.10 23.00 > temp
		echo 120.10 22.25 >> temp
		echo 120.70 22.25 >> temp
		echo 120.70 23.00 >> temp
		gmt plot fault_all.dat -W1.5p -V
		gmt plot temp -W1.5p,0 -Gred -t50 -V
	gmt inset end
gmt end
REM
del *temp* *.conf *.history
pause