gmt set PS_CHAR_ENCODING Standard+
gmt begin PS_encoding04 jpg A+m0.5c
echo 0.5 1 @%%12%%\141\142\143\144\145@%%%% | gmt pstext -JX3i/3i -R0/3/0/3 -B1 -F+f36,blue+jTL 
echo 0.5 2 @%%34%%\141\142\143\144\145@%%%% | gmt pstext -JX -F+f36,red+jTL 
gmt end
pause
