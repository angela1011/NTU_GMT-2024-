gmt begin histogram04 jpg A+m0.5c
  gmt histogram CWAEQs_1995-2022.gmt -R0/100/0/50 -JX12c -Bxa10f5+l"Focal Depth (km)" -Bya10f5+l"Seismicity"+u%% -BWStr ^
 -A -T10 -Lb -W1.5p -G200 -i2 -Z1 -V
gmt end
pause