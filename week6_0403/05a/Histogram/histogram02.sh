gmt begin histogram02 jpg A+m0.5c
gmt histogram CWAEQs_1995-2022.gmt -R0/100/0/210000 -JX10c -Bxa10+l"Focal Depth (km)" -Bya20000+l"Counts" -BWStr -D+f8p,4+o8p -T10 -Lb -W1.5p -G200 -i2 -Z0 -V
gmt end