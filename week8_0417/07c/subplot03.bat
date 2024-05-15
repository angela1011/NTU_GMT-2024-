gmt begin subplot03 jpg A+m0.5c
gmt get FONT_TAG
gmt text -L
gmt set FONT_TAG 15p,Times-Roman
gmt subplot begin 2x2 -Fs4.0i/4.0i -A(a)+jTL+o0.2c/0.4c -M0.5c/0.2c -R-20/20/-20/20
gmt basemap -Ba -BWSen
echo 0 0 01| gmt text -F+f20p,0,black
gmt basemap -Ba -BWSen -c
echo 0 0 02| gmt text -F+f20p,0,black
gmt basemap -Ba -BWSen -c
REM 下面的 gmt plot命令未使用-c 選項，但依然在第2行第1列子圖中繪製
REM reply: -c選項為跳到下一張子圖，後續未使用-c代表是在當前子圖上作畫，再一次-c就會跳到下一張
REM 這邊以GMT TEXT標記子圖順序供參考
::echo 0 0 | gmt plot -Sa1c -Gred -W1p
echo 0 0 03| gmt text -F+f20p,0,black
gmt basemap -Ba -BWSen -c
echo 0 0 04| gmt text -F+f20p,0,black
gmt subplot end
gmt end
pause