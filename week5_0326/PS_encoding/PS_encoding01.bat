REM -F[+a[angle]][+c[justify]][+f[font]][+h][+j[justify]][+l]
REM +f: set the font (size,fontname,color); if no font info is given then the input file must have this information in one of its columns

gmt set PS_CHAR_ENCODING Standard+
gmt begin code_standard+ jpg A+m0.5c
echo 1 0.5 \201 | gmt text -JX5i/5i -R0/2/0/2 -B1  -F+f40+jTC -V
echo 1 1 \202 | gmt text -JX5i/5i -R0/2/0/2 -B1  -F+f40+jTC -V
echo 1 1.5 \203 | gmt text -JX5i/5i -R0/2/0/2 -B1  -F+f40+jTC -V
gmt end
pause