REM example from https://docs.generic-mapping-tools.org/latest/supplements/seis/coupe.html
REM modift shell script to batch file
REM -Sa: Focal mechanisms in Aki and Richards convention. 
REM Parameters are expected to be in the following columns:
REM Lon Lat depth strike dip rake Lon1(opt) Lat1(opt) text

echo 112 32 25  30  90   0  4  Strike-slip > coupe01.gmt
echo 115 34 15  30  60  90  5  Reverse >> coupe01.gmt
echo 118 32 45  30  60 -90  6  Normal >> coupe01.gmt
gmt coupe coupe01.gmt -Sa1c -Aa111/33/119/33+d90+w500+z0/50+r -Q ^
            -JX15c/-8c -Bxaf+l"Distance (km)" -Byaf+l"Depth (km)" -BWSen -jpg test_coupe01
pause