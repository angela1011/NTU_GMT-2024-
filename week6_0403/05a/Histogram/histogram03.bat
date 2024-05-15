gmt begin histogram03 jpg A+m0.5c
 gmt histogram CWAEQs_1995-2022.gmt -R0/100/0/225000 -JX12c -Bxa10f5+l"Focal Depth (km)" -Bya40000f20000+l"Counts" -BWStr ^
 -A -D+f10p,4 -T10 -Lb -W1.5p -G200 -i2 -Z0 -V
gmt end
pause