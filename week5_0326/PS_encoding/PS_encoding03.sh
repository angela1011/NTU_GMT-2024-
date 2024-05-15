gmt set PS_CHAR_ENCODING Standard+
gmt begin code_standard+03 jpg A+m0.5c
echo 1 9 The @~FTF@~ Republic of China | gmt text -JX6i/10i -R0/10/0/10 -B2 -F+f24+jTL -V 
echo 1 8 Stress @~s@~@+*@+@-zz@- is 100 MPa | gmt text -JX -B2 -F+f24+jTL -V
echo 1 7 C@#''est@# L@#a@# V@#ie!@# '('S@#mall@# C@#aps@#')' | gmt text -JX -B2 -F+f24+jTL -V
echo 1 6 @_Thinking, Fast and Slow@_ | gmt text -JX -B2 -F+f28+jTL -V
echo 1 5 @%31%Using @%28%different @%17%fonts@%% | gmt text -JX -B2 -F+f24+jTL -V
echo 1 4 @:28:Size@:: @:24:and scale@:: @:32:matter!@:: | gmt text -JX -B2 -F+jTL -V
echo 1 3 @\;red\;Colorful@\;\; @\;blue\;life@\;\; | gmt text -JX -B2 -F+f28+jTL -V
echo 1 2 @!CV @@@!UNCODE | gmt text -JX -B2 -F+f24+jTL -V
echo 1 1 @%31%15\%@%% | gmt text -JX -B2 -F+f28+jTL -V
gmt end