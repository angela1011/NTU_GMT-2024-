gmt set PS_CHAR_ENCODING Standard+
gmt begin code_standard+02 jpg A+m0.5c
echo 1 5 2@~p@~r@+2@+h@-0@-E\363tv\363s | gmt text -JX6i/6i -R0/6/0/6 -B2 -F+f24+jTL -V 
echo 1 4 10@+-3@+@Angstr@om | gmt text -JX -B2 -F+f24+jTL -V 
echo 1 3 Se@nor Gar@con | gmt text -JX -B2 -F+f24+jTL -V 
echo 1 2 M@!\305anoa stra@se | gmt text -JX -B2 -F+f28+jTL -V
echo 1 1 A@#cceleration@# (MS@+-2@+) | gmt text -JX -B2 -F+f24+jTL -V
gmt end
pause

