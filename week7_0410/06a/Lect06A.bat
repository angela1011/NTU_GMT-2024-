REM original batch file from Pei-Ling Wang and modified by Hsiu-Fang Lee, Department of Geosciences, NTU
REM Edited by Bo-Han Tsao and Jyr-Ching Hu, Department of Geosciences, NTU for GMT 6.0
REM
REM set variables
set prefix=Lect06A
set range=119.2/122.8/21.4/25.5
set grd=c:/gridfiles/tw80m.nc
set cpt1=topo_gray.cpt
set cpt2=fpcolor.cpt
REM configure
gmt set PROJ_LENGTH_UNIT=inch FORMAT_GEO_MAP=ddd:mm:ssG

gmt makecpt -Cgray -T0/4000/500 -I -N > topo_gray.cpt -V

gmt begin %prefix% jpg A+m0.5c
    gmt basemap -R%range% -Jm121.0/1.8 -V -Bxa0.5f0.25 -Bya0.5f0.25 -BWSen
	gmt grdimage %grd% -C%cpt1% -I+a45+ne1.0 -V
    gmt coast -Df -W1 -S212/231/237 -V
	
	REM ======= Plot title string =======
echo 121 25.70 22,2 MC Historical earthquakes (M@-w@- \076 6) and seismicity | gmt text -F+f+j -N -V
    
    REM ====== 1999 Sort by magnitude ===========
    gawk " { if ($4 < 2)  print $1, $2, $3}" 1900-201907EQs.txt | gmt plot -C%cpt2% -Sc.01 -V
    gawk " { if ($4 >= 2 && $4 < 3) print $1, $2, $3}" 1900-201907EQs.txt | gmt plot -C%cpt2% -Sc.01 -V
    gawk " { if ($4 >= 3 && $4 < 4) print $1, $2, $3}" 1900-201907EQs.txt | gmt plot -C%cpt2% -Sc.03 -V
    gawk " { if ($4 >= 4 && $4 < 5) print $1, $2, $3}" 1900-201907EQs.txt | gmt plot -C%cpt2% -Sc.04 -V
    gawk " { if ($4 >= 5 && $4 < 6) print $1, $2, $3}" 1900-201907EQs.txt | gmt plot -C%cpt2% -Sc.06 -V
    gawk " { if ($4 >= 6 && $4 < 7) print $1, $2, $3}" 1900-201907EQs.txt | gmt plot -C%cpt2% -Sc.09 -V
    
    
    REM ====== Basement high ============
    gmt plot basement.gmt -W1,185/100/50,2_1:3p -V
    echo 120.3 25.3 11,1,185/100/50 MC Basement High | gmt text -F+f+j -G255/255/255 -V
    
    gmt coast -Df -W1 -V
    
    REM ===== Plot faults =====
    gmt plot Category_I_WGS84.txt -W1,0/0/0 -V
    gmt plot Category_I_concealed_WGS84.txt -W1,0/0/0,2_1_2_1:0p -V
    gmt plot Category_I_WGS84.txt -W1,0/0/0 -V
    gmt plot Category_II_concealed_WGS84.txt -W1,0/0/0,2_1_2_1:0p -V
    
    REM ===== Beachballs =====
    gmt meca 1935-2010_his_earthquake.txt -Sa0.3i+f8p+o2p -A -V
    gawk "{print $1, $2, $3*0.022}" epicenters_2010.txt | gmt plot -Sa -G0/0/0 -V
    gmt meca 201011-201904CMT.txt -Sa0.3i+f8p+o2p -A -V
    gawk "{print $1, $2, $3*0.022}" epicenters_201011-201904.txt | gmt plot -Sa -G0/0/0 -V
    
    REM ======= Plot Scale Points ===================
    echo 121.6 21.1 | gmt plot -Sc.01 -W1 -N -V
    echo 121.8 21.1 | gmt plot -Sc.03 -W1 -N -V
    echo 122.0 21.1 | gmt plot -Sc.04 -W1 -N -V
    echo 122.2 21.1 | gmt plot -Sc.06 -W1 -N -V
    echo 122.4 21.1 | gmt plot -Sc.09 -W1 -N -V
    echo 122.6 21.1 | gmt plot -Sc.11 -W1 -N -V
    REM ======= Plot Scale Text ====================
    echo 121.3 21.1 12,1,0 MC M@-L@- | gmt text -F+f+j -C0.01/0.01 -N -V
    echo 121.5 21.1 8,1,255/255/0 MC 2 | gmt text -F+f+j -G255/0/0 -C0.01/0.01 -N -V
    echo 121.7 21.1 8,1,255/255/0 MC 3 | gmt text -F+f+j -G255/0/0 -C0.01/0.01 -N -V
    echo 121.9 21.1 8,1,255/255/0 MC 4 | gmt text -F+f+j -G255/0/0 -C0.01/0.01 -N -V
    echo 122.1 21.1 8,1,255/255/0 MC 5 | gmt text -F+f+j -G255/0/0 -C0.01/0.01 -N -V
    echo 122.3 21.1 8,1,255/255/0 MC 6 | gmt text -F+f+j -G255/0/0 -C0.01/0.01 -N -V
    echo 122.5 21.1 8,1,255/255/0 MC 7 | gmt text -F+f+j -G255/0/0 -C0.01/0.01 -N -V
                                                                                                                                                                                                                                                                                                             
    echo 121.25  21.6 > Firstsymbol.dat
    echo 121.50  21.6 >> Firstsymbol.dat 
    echo 121.25  21.6 > Questionsymbol.dat
    echo 121.50  21.6 >> Questionsymbol.dat 
    gmt plot Firstsymbol.dat -W0.03c,black -N -Y-1.3 -V
    echo 121.55  21.6  10,1,black ML Active fault | gmt text -F+f+j -N -V
    gmt plot Questionsymbol.dat -W0.03c,black,2_1_2_1:0p -V -N -Y-0.3
    echo 121.55  21.6  10,1,black ML Active fault (concealed or inferred) | gmt text -F+f+j -N -V
    
REM gmt colorbar -C%cpt2% -Dx0.0/0.8+w3.0/0.1+h -Bx+l"Focal_depth" -By+l"km" -L -I -V -Y0.1
	gmt colorbar -C%cpt2% -Dx0.0/0.8+w3.0/0.1+h -Bx+l"Focal_depth" -By+l"km" -I -V -Y0.1
    
gmt end
del *.conf *.history
pause








