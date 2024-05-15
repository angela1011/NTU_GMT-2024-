gmt begin subplot02 jpg A+m0.5c
gmt subplot begin 2x2 -Fs5c/3c -A -M0.5c
gmt subplot set 0
gmt basemap -R0/20/0/10 -JX11.2c/3c -Baf -BWSen
gmt subplot set 2 -A(b)
gmt basemap -R0/20/0/10 -JX? -Baf -BWSen
gmt subplot set 3 -A(c)
gmt basemap -R0/20/0/10 -JX? -Baf -BWSen
gmt subplot end
gmt end