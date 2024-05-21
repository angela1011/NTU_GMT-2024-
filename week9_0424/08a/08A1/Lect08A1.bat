REM Example from cookbook
gmt begin Lect08A1 jpg 
REM Long. Lat. Evel Nvel Esig Nsig CorEN SITE
REM (deg) (deg) (mm/yr) (mm/yr)
	echo -7. 0. 5.0 0.0 2.0 3.0 0.500 NTU1 > GPS1.gmt
	echo -4. 0. 0.0 5.0 2.0 3.0 0.500 NTU2 >> GPS1.gmt
	echo -3. 5. -5.0 0.0 2.0 3.0 0.500 NTU3 >> GPS1.gmt
	echo -8. 5. 0.0 -5.0 0.0 0.0 0.500 NTU4 >> GPS1.gmt
	echo -1. 7. 3.0 3.0 1.0 1.0 0.100 NTU5 >> GPS1.gmt
	gmt velo GPS1.gmt -R-10/10/-10/10 -Wthin,red -Se0.2c/0.39+f12 -Ba2g1 -BWeSn -Jx0.2i -Ggreen -Eblue -L -N
	:gmt velo GPS1.gmt -R-10/10/-10/10 -Wthin,red -Se0.2c/0.39+f12 -Ba2g1 -BWeSn -Jx0.2i -Ggreen -Eblue -L -N -A1c+p3p+e
	:: the vector attributes would follow -A option rather than -S option if it is assigned.

REM Long. Lat. Evel Nvel Esig Nsig CorEN SITE
REM  (deg) (deg) (mm/yr) (mm/yr)
	echo 0. -8. 0.0 0.0 2.0 3.0 0.100 NTU6 > GPS2.gmt
	echo -7. 7. 3.0 3.0 0.0 0.0 0.200 NTU7 >> GPS2.gmt
	echo 0. 2. 4.0 6.0 2.0 3.0 0.300 NTU8 >> GPS2.gmt
	echo -5. -5. 6.0 2.0 3.0 4.0 0.400 NTU9 >> GPS2.gmt
	echo 7. 0. -6.0 2.0 3.0 4.0 -0.300 NTU0 >> GPS2.gmt
	echo 3. -4. 6.0 -4.0 3.0 2.0 -0.500 NTUA >> GPS2.gmt
gmt velo GPS2.gmt -Se0.2c/0.39+f14 -A0.25c+p0.25p+e

gmt end
pause