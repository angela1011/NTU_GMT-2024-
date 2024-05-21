REM Drawing rotation rate 
gmt begin Lect08C1 jpg A+m0.5c
REM Left three wedges
REM lon lat rotation rate(rad/yr) rotationR_sigma (rad/yr)
	echo 241.2 34.2 5.65E-08 1.17E-08 > rotationR1.gmt
	echo 241.2 34.5 -4.85E-08 1.85E-08 >> rotationR1.gmt
	echo 241.2 34.7 4.46E-09 3.07E-08 >> rotationR1.gmt
	gmt velo rotationR1.gmt -JM15c -R241/242/34/35 -Ba0.5f0.25 -BWeSn+t"Rotation Rate" -Sw3c/1.e7 -W1p -G60 -E210 -D2 

REM  Right three wedges
	echo 241.7 34.2 5.65E-08 1.17E-08 > rotationR2.gmt
	echo 241.7 34.5 -4.85E-08 1.85E-08 >> rotationR2.gmt
	echo 241.7 34.7 4.46E-09 3.07E-08>> rotationR2.gmt
	gmt velo rotationR2.gmt -Sw3c/1.e7 -W1p -D2
	gmt coast -W1p -Dh
gmt end