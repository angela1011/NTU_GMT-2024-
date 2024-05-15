REM https://docs.generic-mapping-tools.org/latest/legend.html
REM Batch file created by Jyr-Ching HU based on shell script
gmt begin Lect07A jpg A+m0.5c
gmt makecpt -Cpanoply -T-8/8 -H > tt.cpt
gmt set FONT_ANNOT_PRIMARY 12p
REM Legend test for gmt pslegend
REM G is vertical gap, V is vertical line, N sets # of columns, D draws horizontal line,
REM H is ps=legend.ps
REM 
echo G -0.1i > legend.gmt
echo H 24p,Times-Roman My Map Legend >> legend.gmt
echo D 0.2i 1p >> legend.gmt
echo N 2 >> legend.gmt
echo V 0 1p >> legend.gmt
echo S 0.1i c 0.15i p300/12 0.25p 0.3i This circle is hachured >> legend.gmt
echo S 0.1i e 0.15i yellow 0.25p 0.3i This ellipse is yellow >> legend.gmt
echo S 0.1i w 0.15i green 0.25p 0.3i This wedge is green >> legend.gmt
echo S 0.1i f 0.25i blue 0.25p 0.3i This is a fault >> legend.gmt
echo S 0.1i - 0.15i - 0.25p,- 0.3i A contour >> legend.gmt
echo S 0.1i v 0.25i magenta 0.5p 0.3i This is a vector >> legend.gmt
echo S 0.1i i 0.15i cyan 0.25p 0.3i This triangle is boring >> legend.gmt
echo D 0.2i 1p >> legend.gmt
echo V 0 1p >> legend.gmt
echo N 1 >> legend.gmt
echo M 5 5 600+u+f >> legend.gmt
echo G 0.05i >> legend.gmt
echo I @SOEST_block4.png 3i CT >> legend.gmt
echo G 0.05i >> legend.gmt
echo B tt.cpt 0.2i 0.2i -B0 >> legend.gmt
echo G 0.05i >> legend.gmt
echo L 9p,Times-Roman R Smith et al., @%%5%%J. Geophys. Res., 99@%%%%, 2000 >> legend.gmt
echo G 0.1i >> legend.gmt
echo T Let us just try some simple text that can go on a few lines. >> legend.gmt
echo T There is no easy way to predetermine how many lines may be required >> legend.gmt
echo T so we may have to adjust the height to get the right size box. >> legend.gmt
gmt legend legend.gmt -R0/10/0/10 -JM6i -Dx0.5i/0.5i+w5i+jBL+l1.2 -F+p+gazure1+r+c0.1i -B5f1 -V 
del tt.cpt
gmt end
pause