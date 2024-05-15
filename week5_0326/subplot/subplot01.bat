gmt begin subplot01 jpg A+m0.5c
  gmt subplot begin 2x2 -Fs8c -M5p -A(a) -SCb -SRl -Bwstr -V
    gmt subplot set 0 -V
    gmt basemap -R0/80/0/10
    gmt subplot set 1 -V
    gmt basemap -R0/80/0/10
    gmt subplot set 2 -V
    gmt basemap -R0/80/0/10
    gmt subplot set 3 -V
    gmt basemap -R0/80/0/10
  gmt subplot end
gmt end
pause