REM Psvelo: strain crosses for strain rate field in SW Taiwan
REM Original batch file is from Jyr-Ching Hu, Department of Geosciences, NTU
REM Edited nt Bo-Han Tsao, Department of Geosciences, NTU for GMT6.0

REM ========= Set variables =========
set preifx=Lect09D
set grd=C:/gridfiles/Taiwan40m_WGS84.nc
set fault11=Category_I_WGS84.txt
set fault12=Category_I_concealed_WGS84.txt
set fault21=Category_II_WGS84.txt
set fault22=Category_II_concealed_WGS84.txt
REM ======== Set configuration ======
set FORMAT_GEO_MAP=+ddd:mm:ssG
REM ====== Make cpt ======
gmt grd2cpt %grd% -T0/4000/200 -Z -Cdem3 > tw_dem3.cpt
REM ====== GMT plot: principal strain rate ======
gmt begin %preifx% tif A+m0.5c
    gmt basemap -R120/121.1/23/24 -Jm121.0/5.5i -Bx0.5f0.25 -By0.5f0.25 -V
    gmt grdimage %grd% -Ctw_dem3.cpt -I+a45+ne1.0 -V
    gmt coast -Df -W0.3p,0 -Slightcyan -V
    gmt plot %fault11% -W0.8p,red -V
    gmt plot %fault12% -W0.8p,red,- -V
    gmt plot %fault21% -W0.8p,black -V
    gmt plot %fault22% -W0.8p,black,- -V
    gmt plot station.txt -Sc0.05 -W2.5p -Gblack -V
    gmt velo Strain.txt -Sx0.8 -W2p,blue -A+a45+n1.0 -V
    echo 120.15 23.90 -1 0 180 | gmt velo -Sx0.8 -W1p,0/0/0 -A+a45+n1.0 -V
    echo 120.15 23.85 12,0 0 MC 1 @~m@~strain/yr | gmt text -F+f+a+j -V
    gmt colorbar -Ctw_dem3.cpt -Dx2.8i/-0.5i+w5.4i/0.1i+jMC+h+e -Bx500+l"Elevation (40m DEM)" -By+lm -I -V
    REM ====== Plot Strain Nets ======
    echo 120.9082 23.8811 SUNM > netA
    echo 120.5015 23.6607 S094 >> netA
    echo 120.5845 23.6596 M372 >> netA
    echo 120.6894 23.6901 M498 >> netA
    echo 120.9082 23.8811 SUNM >> netA     
    gmt plot netA -W1p -V
    echo 120.5015 23.6607 S094 > netB
    echo 120.5845 23.6596 M372 >> netB
    echo 120.5764 23.6306 M454 >> netB
    echo 120.4752 23.5644 S103 >> netB
    echo 120.2166 23.5991 S005 >> netB
    echo 120.5015 23.6607 S094 >> netB
    gmt plot netB -W1p -V 
    echo 120.2166 23.5991 S005 > netC
    echo 120.4752 23.5644 S103 >> netC
    echo 120.4436 23.4201 S008 >> netC  
    echo 120.4193 23.3024 C003 >> netC
    echo 120.1887 23.3825 S004 >> netC
    echo 120.2166 23.5991 S005 >> netC    
    gmt plot netC -W1p -V
    echo 120.1887 23.3825  S004 > netD
    echo 120.4193 23.3024  C003 >> netD
    echo 120.3831 23.2541  S007 >> netD
    echo 120.3394 23.2054  S011 >> netD
    echo 120.1627 23.1731  S003 >> netD
    echo 120.1887 23.3825  S004 >> netD 
    gmt plot netD -W1p -V
    echo 120.3394 23.2054 S011 > netE
    echo 120.4883 23.0595 S012 >> netE
    echo 120.1627 23.1731 S003 >> netE
    echo 120.3394 23.2054 S011 >> netE
    gmt plot netE -W1p -V
    echo 120.5845 23.6596 M372 > netF
    echo 120.5764 23.6306 M454 >> netF
    echo 120.6949 23.4701 S326 >> netF
    echo 120.6894 23.6901 M498 >> netF
    echo 120.5845 23.6596 M372 >> netF
    gmt plot netF -W1p -V
    echo 120.5764 23.6306 M454 > netG 
    echo 120.4752 23.5644 S103 >> netG
    echo 120.6949 23.4701 S326 >> netG
    echo 120.5764 23.6306 M454 >> netG
    gmt plot netG -W1p -V
    echo 120.4752 23.5644 S103 > netH
    echo 120.5772 23.3617 C002 >> netH
    echo 120.6949 23.4701 S326 >> netH
    echo 120.4752 23.5644 S103 >> netH
    gmt plot netH -W1p -V
    echo 120.4752 23.5644 S103 > netI
    echo 120.4436 23.4201 S008 >> netI
    echo 120.5772 23.3617 C002 >> netI
    echo 120.4752 23.5644 S103 >> netI
    gmt plot netI -W1p -V
    echo 120.4436 23.4201 S008 > netJ     
    echo 120.4193 23.3024 C003 >> netJ 
    echo 120.5772 23.3617 C002 >> netJ 
    echo 120.4436 23.4201 S008 >> netJ 
    gmt plot netJ -W1p -V
    echo 120.5772 23.3617 C002 > netK
    echo 120.4193 23.3024 C003 >> netK
    echo 120.5637 23.2536 S013 >> netK
    echo 120.5772 23.3617 C002 >> netK
    gmt plot netK -W1p -V
    echo 120.4193 23.3024 C003 > netL
    echo 120.3394 23.2054 S011 >> netL
    echo 120.5637 23.2536 S013 >> netL
    echo 120.4193 23.3024 C003 >> netL
    gmt plot netL -W1p -V
    echo 120.5637 23.2536 S013 > netM
    echo 120.3394 23.2054 S011 >> netM
    echo 120.4883 23.0595 S012 >> netM
    echo 120.5637 23.2536 S013 >> netM
    gmt plot netM -W1p -V 
    echo 120.9082 23.8811 SUNM > netN
    echo 120.6894 23.6901 M498 >> netN
    echo 120.6949 23.4701 S326 >> netN
    echo 120.8895 23.4838 S027 >> netN
    echo 120.9082 23.8811 SUNM >> netN
    gmt plot netN -W1p -V
    echo 120.8895 23.4838 S027 > netO
    echo 120.6949 23.4701 S326 >> netO
    echo 120.7216 23.2799 C011 >> netO
    echo 120.9163 23.2822 S026 >> netO
    echo 120.8895 23.4838 S027 >> netO
    gmt plot netO -W1p -V
    echo 120.6949 23.4701 S326 > netP
    echo 120.5772 23.3617 C002 >> netP
    echo 120.7216 23.2799 C011 >> netP
    echo 120.6949 23.4701 S326 >> netP
    gmt plot netP -W1p -V
    echo 120.5772 23.3617 C002 > netQ   
    echo 120.5637 23.2536 S013 >> netQ
    echo 120.6168 23.1194 C007 >> netQ
    echo 120.7216 23.2799 C011 >> netQ
    echo 120.5772 23.3617 C002 >> netQ
    gmt plot netQ -W1p -V
    echo 120.5637 23.2536 S013 > netR
    echo 120.4883 23.0595 S012 >> netR
    echo 120.6168 23.1194 C007 >> netR
    echo 120.5637 23.2536 S013 >> netR
    gmt plot netR -W1p -V
    echo 120.7216 23.2799 C011 > netS
    echo 120.6168 23.1194 C007 >> netS
    echo 120.9163 23.2822 S026 >> netS
    echo 120.7216 23.2799 C011 >> netS
    gmt plot netS -W1p -V   
gmt end
REM Delete unnecessary files
del net* *.conf *.history
pause