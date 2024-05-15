REM Background Seismicity: source data from Seismological Center, Central Weather Administration (交通部中央氣象署), Taiwan
REM Batch file modified by Hu Jyr-Ching, Department of Geosciences, NTU

set prefix=Lect04C1
set range=119/123/21/26
gmt gmtset MAP_ORIGIN_X 1.9i MAP_ORIGIN_Y 1.9i
gmt gmtset PROJ_LENGTH_UNIT inch
gmt gmtset FORMAT_GEO_MAP ddd:mm:ssF

gmt begin %prefix% jpg A+m0.5c
REM Scale: color circles for focal depth
echo 1.6 1.4 0.1 | gmt plot -Jx0.9 -R0/10/0/10 -Sc -G250/0/0 -W0.5 -X0.15 -Y1.5 -V
echo 2.3 1.4 0.1 | gmt plot -Sc -G255/195/135 -W0.5 -V
echo 3.1 1.4 0.1 | gmt plot -Sc -G250/250/0 -W0.5 -V
echo 3.9 1.4 0.1 | gmt plot -Sc -G50/250/100 -W0.5 -V
echo 4.7 1.4 0.1 | gmt plot -Sc -G50/200/250 -W0.5 -V 
echo 5.5 1.4 0.1 | gmt plot -Sc -G0/0/200 -W0.5 -V
REM Scale text
echo 1.6 1.1 10,1 CM 0-15 | gmt text -F+f+j -V 
echo 2.3 1.1 10,1 CM 15-30 | gmt text -F+f+j -V   
echo 3.1 1.1 10,1 CM 30-50 | gmt text -F+f+j -V  
echo 3.9 1.1 10,1 CM 50-80 | gmt text -F+f+j -V 
echo 4.7 1.1 10,1 CM 80-120 | gmt text -F+f+j -V 
echo 5.5 1.1 10,1 CM 120-300 | gmt text -F+f+j -V 
REM Scale for magnitude
echo 6.4 1.4 0.02 | gmt plot -Sc -G0 -W1 -V
echo 6.8 1.4 0.03 | gmt plot -Sc -G0 -W1 -V
echo 7.2 1.4 0.04 | gmt plot -Sc -G0 -W1 -V
echo 7.6 1.4 0.05 | gmt plot -Sc -G0 -W1 -V
echo 8.0 1.4 0.06 | gmt plot -Sc -G0 -W1 -V
echo 6.2 1.1 10,1 CM M@-L@-= | gmt text -F+f+j -N -V
echo 6.4 1.1 10,1 CM 2 | gmt text -F+f+j -N -V
echo 6.8 1.1 10,1 CM 3 | gmt text -F+f+j -N -V
echo 7.2 1.1 10,1 CM 4 | gmt text -F+f+j -N -V
echo 7.6 1.1 10,1 CM 5 | gmt text -F+f+j -N -V
echo 8.0 1.1 10,1 CM 6 | gmt text -F+f+j -N -V

REM Base map and title 
gmt basemap -JM121/23/15C -R%range% -Bxa1f0.5 -Bya1f0.5 -BWeSn+t"Seismicity in and around Taiwan (CWA, 1995-2022)" --FONT_TITLE=18p,16,blue --MAP_TITLE_OFFSET=2p -V -Y1.8 -X1.5
REM Seismicity
gawk "{print $1, $2, -$3, $4}" CWAEQs_1995-2022.txt > CWAEQs_1995-2014.gmt
gawk "{if ($3 <= 15) print $1, $2, $3, $4}" CWAEQs_1995-2022.gmt > hypo_0_15.gmt
gawk "{if ($3 > 15 && $3 <= 30) print $1, $2, $3, $4 }" CWAEQs_1995-2022.gmt > hypo_15_30.gmt 
gawk "{if ($3 > 30 && $3 <= 50) print $1, $2, $3, $4 }" CWAEQs_1995-2022.gmt > hypo_30_50.gmt 
gawk "{if ($3 > 50 && $3 <= 80) print $1, $2, $3, $4 }" CWAEQs_1995-2022.gmt > hypo_50_80.gmt 
gawk "{if ($3 > 80 && $3 <= 120) print $1, $2, $3, $4 }" CWAEQs_1995-2022.gmt > hypo_80_120.gmt
gawk "{if ($3 > 120 && $3 <= 300) print $1, $2, $3, $4 }" CWAEQs_1995-2022.gmt > hypo_120_300.gmt
gawk "{print $1, $2, $4*0.01}" hypo_0_15.gmt | gmt plot -Sc -G250/0/0 -W0.2 -V
gawk "{print $1, $2, $4*0.01}" hypo_15_30.gmt | gmt plot -Sc -G250/195/135 -W0.2 -V
gawk "{print $1, $2, $4*0.01}" hypo_30_50.gmt | gmt plot -Sc -G250/250/0 -W0.2 -V 
gawk "{print $1, $2, $4*0.01}" hypo_50_80.gmt | gmt plot -Sc -G50/250/100 -W0.2 -V 
gawk "{print $1, $2, $4*0.01}" hypo_80_120.gmt | gmt plot -Sc -G50/200/250 -W0.2 -V
gawk "{print $1, $2, $4*0.01}" hypo_120_300.gmt | gmt plot -Sc -G0/0/200 -W0.2 -V
gmt coast -Dh -W1,0 -V
gmt plot ActiveFaults_CGS2010_WGS84.txt -W0.5,0 -V
gmt end

del  *.conf 
pause