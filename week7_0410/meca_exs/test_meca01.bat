REM Example from https://docs.gmt-china.org/6.5/module/meca/
REM Using quick modern mode
REM Long Lat focal depth(km) strike dip rake Mag newX newY ID

echo 104.33 31.91 39.8 32 64 85 7 0 0 event A > beachball.gmt
echo 104.11 31.52 27.1 22 53 57 6 0 0 event B >> beachball.gmt
gmt meca beachball.gmt -JQ104/15c -R102.5/105.5/30.5/32.5 -Ba -Sa1c -jpg beachball01 -V
pause
