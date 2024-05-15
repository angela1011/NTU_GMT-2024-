# Background Seismicity: source data from Seismological Center, Central Weather Administration (交通部中央氣象署), Taiwan
# Batch file modified by Hu Jyr-Ching, Department of Geosciences, NTU

prefix=HW04_2
range=119/123/21/26
gmt gmtset MAP_ORIGIN_X 1.9i MAP_ORIGIN_Y 1.9i
gmt gmtset PROJ_LENGTH_UNIT inch
gmt gmtset FORMAT_GEO_MAP ddd:mm:ssF

gmt begin $prefix jpg A+m0.5c
# Scale: color circles for focal depth
# echo 1.6 1.4 0.1 | gmt plot -Jx0.9 -R0/10/0/10 -Sc -G250/0/0 -W0.5 -X0.15 -Y1.5 -V 
# echo 2.3 1.4 0.1 | gmt plot -Sc -G255/195/135 -W0.5 -V 
# echo 3.1 1.4 0.1 | gmt plot -Sc -G250/250/0 -W0.5 -V 
# echo 3.9 1.4 0.1 | gmt plot -Sc -G50/250/100 -W0.5 -V 
# echo 4.7 1.4 0.1 | gmt plot -Sc -G50/200/250 -W0.5 -V 
# echo 5.5 1.4 0.1 | gmt plot -Sc -G0/0/200 -W0.5 -V 
# # Scale text
# echo 1.6 1.1 10,1 CM 0-15 | gmt text -F+f+j -V 
# echo 2.3 1.1 10,1 CM 15-30 | gmt text -F+f+j -V 
# echo 3.1 1.1 10,1 CM 30-50 | gmt text -F+f+j -V 
# echo 3.9 1.1 10,1 CM 50-70 | gmt text -F+f+j -V 
# echo 4.7 1.1 10,1 CM 70-100 | gmt text -F+f+j -V  
# echo 5.5 1.1 10,1 CM 100 | gmt text -F+f+j -V  
# # Scale for magnitude
# echo 6.4 1.4 0.02 | gmt plot -Sc -G0 -W1 -V 
# echo 6.8 1.4 0.03 | gmt plot -Sc -G0 -W1 -V 
# echo 7.2 1.4 0.04 | gmt plot -Sc -G0 -W1 -V 
# echo 7.6 1.4 0.05 | gmt plot -Sc -G0 -W1 -V 
# echo 8.0 1.4 0.06 | gmt plot -Sc -G0 -W1 -V 
# echo 6.2 1.1 10,1 CM M@-L@-= | gmt text -F+f+j -N -V 
# echo 6.4 1.1 10,1 CM 2 | gmt text -F+f+j -N -V 
# echo 6.8 1.1 10,1 CM 3 | gmt text -F+f+j -N -V 
# echo 7.2 1.1 10,1 CM 4 | gmt text -F+f+j -N -V 
# echo 7.6 1.1 10,1 CM 5 | gmt text -F+f+j -N -V 
# echo 8.0 1.1 10,1 CM 6 | gmt text -F+f+j -N -V 

# Base map and title
gmt subplot begin 3x2 -Fs15c/10c -A -M1.2c
gmt subplot set 0 -A'(a)' 
gmt basemap -JM121/23/15C -R$range --FONT_TITLE=18p,16,blue --MAP_TITLE_OFFSET=2p -V -Y1.8 -X1.5
# Seismicity
awk '{print $1, $2, -$3, $4}' CWAEQs_1995-2022.txt > CWAEQs_1995-2022.gmt
awk '{if ($3 <= 15) print $1, $2, $3, $4}' CWAEQs_1995-2022.gmt > hypo_0_15.gmt
awk '{print $1, $2, $4*0.01}' hypo_0_15.gmt | gmt plot -Sc -G250/0/0 -W0.2 -V
gmt coast -Dh -W1,0 -V -R$range -Bxa1f0.5 -Bya1f0.5 -BWeSn+t'Seismicity of 0-15 km depth'
gmt plot ActiveFaults_CGS2010_WGS84.txt -W0.5,0 -V

gmt subplot set 1 -A'(b)'
gmt basemap -JM121/23/15C -R$range --FONT_TITLE=18p,16,blue --MAP_TITLE_OFFSET=2p -V -Y1.8 -X1.5
# Seismicity
awk '{print $1, $2, -$3, $4}' CWAEQs_1995-2022.txt > CWAEQs_1995-2022.gmt
awk '{if ($3 > 15 && $3 <= 30) print $1, $2, $3, $4 }' CWAEQs_1995-2022.gmt > hypo_15_30.gmt 
awk '{print $1, $2, $4*0.01}' hypo_15_30.gmt | gmt plot -Sc -G250/195/135 -W0.2 -V
gmt coast -Dh -W1,0 -V -R$range -Bxa1f0.5 -Bya1f0.5 -BWeSn+t'Seismicity of 15-30 km depth'
gmt plot ActiveFaults_CGS2010_WGS84.txt -W0.5,0 -V

gmt subplot set 2 -A'(c)'
gmt basemap -JM121/23/15C -R$range --FONT_TITLE=18p,16,blue --MAP_TITLE_OFFSET=2p -V -Y1.8 -X1.5
# Seismicity
awk '{print $1, $2, -$3, $4}' CWAEQs_1995-2022.txt > CWAEQs_1995-2022.gmt
awk '{if ($3 > 30 && $3 <= 50) print $1, $2, $3, $4 }' CWAEQs_1995-2022.gmt > hypo_30_50.gmt 
awk '{print $1, $2, $4*0.01}' hypo_30_50.gmt | gmt plot -Sc -G250/250/0 -W0.2 -V 
gmt coast -Dh -W1,0 -V -R$range -Bxa1f0.5 -Bya1f0.5 -BWeSn+t'Seismicity of 30-50 km depth'
gmt plot ActiveFaults_CGS2010_WGS84.txt -W0.5,0 -V

gmt subplot set 3 -A'(d)'
gmt basemap -JM121/23/15C -R$range --FONT_TITLE=18p,16,blue --MAP_TITLE_OFFSET=2p -V -Y1.8 -X1.5
# Seismicity
awk '{print $1, $2, -$3, $4}' CWAEQs_1995-2022.txt > CWAEQs_1995-2022.gmt
awk '{if ($3 > 50 && $3 <= 70) print $1, $2, $3, $4 }' CWAEQs_1995-2022.gmt > hypo_50_70.gmt 
awk '{print $1, $2, $4*0.01}' hypo_50_70.gmt | gmt plot -Sc -G50/250/100 -W0.2 -V 
gmt coast -Dh -W1,0 -V -R$range -Bxa1f0.5 -Bya1f0.5 -BWeSn+t'Seismicity of 50-70 km depth'
gmt plot ActiveFaults_CGS2010_WGS84.txt -W0.5,0 -V

gmt subplot set 4 -A'(e)'
gmt basemap -JM121/23/15C -R$range --FONT_TITLE=18p,16,blue --MAP_TITLE_OFFSET=2p -V -Y1.8 -X1.5
# Seismicity
awk '{print $1, $2, -$3, $4}' CWAEQs_1995-2022.txt > CWAEQs_1995-2022.gmt
awk '{if ($3 > 70 && $3 <= 100) print $1, $2, $3, $4 }' CWAEQs_1995-2022.gmt > hypo_70_100.gmt
awk '{print $1, $2, $4*0.01}' hypo_70_100.gmt | gmt plot -Sc -G50/200/250 -W0.2 -V
gmt coast -Dh -W1,0 -V -R$range -Bxa1f0.5 -Bya1f0.5 -BWeSn+t'Seismicity of 70-100 km depth'
gmt plot ActiveFaults_CGS2010_WGS84.txt -W0.5,0 -V

gmt subplot set 5 -A'(f)'
gmt basemap -JM121/23/15C -R$range --FONT_TITLE=18p,16,blue --MAP_TITLE_OFFSET=2p -V -Y1.8 -X1.5
# Seismicity
awk '{print $1, $2, -$3, $4}' CWAEQs_1995-2022.txt > CWAEQs_1995-2022.gmt
awk '{if ($3 > 100) print $1, $2, $3, $4 }' CWAEQs_1995-2022.gmt > hypo_100.gmt
awk '{print $1, $2, $4*0.01}' hypo_100.gmt | gmt plot -Sc -G0/0/200 -W0.2 -V
gmt coast -Dh -W1,0 -V -R$range -Bxa1f0.5 -Bya1f0.5 -BWeSn+t'Seismicity of > 100 kmm depth'
gmt plot ActiveFaults_CGS2010_WGS84.txt -W0.5,0 -V
gmt subplot end

# Scale: color circles for focal depth
echo 1.6 1.4 0.1 | gmt plot -Jx0.9 -R0/10/0/10 -Sc -G250/0/0 -W0.5 -X2.0 -Y-2.0 -V 
echo 2.3 1.4 0.1 | gmt plot -Sc -G255/195/135 -W0.5 -V 
echo 3.1 1.4 0.1 | gmt plot -Sc -G250/250/0 -W0.5 -V 
echo 3.9 1.4 0.1 | gmt plot -Sc -G50/250/100 -W0.5 -V 
echo 4.7 1.4 0.1 | gmt plot -Sc -G50/200/250 -W0.5 -V 
echo 5.5 1.4 0.1 | gmt plot -Sc -G0/0/200 -W0.5 -V 
# Scale text
echo 1.6 1.1 10,1 CM 0-15 | gmt text -F+f+j -V 
echo 2.3 1.1 10,1 CM 15-30 | gmt text -F+f+j -V 
echo 3.1 1.1 10,1 CM 30-50 | gmt text -F+f+j -V 
echo 3.9 1.1 10,1 CM 50-70 | gmt text -F+f+j -V 
echo 4.7 1.1 10,1 CM 70-100 | gmt text -F+f+j -V  
echo 5.5 1.1 10,1 CM 100 | gmt text -F+f+j -V  
# Scale for magnitude
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
gmt end

rm  *.conf