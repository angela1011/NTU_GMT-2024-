REM Draw elevation of Afric based on ETopo2 

gmt begin Hw01_yournameinEnglish jpg
gmt set MAP_FRAME_TYPE = fancy
gmt grdcut etopo2.nc -Gafrica.nc -R-25/55/-40/40

REM put your commonds here, please refer to Lect02C.bat

gmt coast -R-25/55/-40/40 -Jm15/0/0.06i -Ba10f5 -N1/0.25p,- -W1/0.5p,black -V
gmt e
