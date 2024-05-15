# Original batch file was created by Ying-Ping Kuo (郭鶯萍) at #ote Sensing and Geodetic Lab, Department of Geosciences, NTU.
# Batch file modified by Jyr-Ching Hu at Department of Geoscicences, National Taiwan University
# Background seismicity and aftershocks of Meinong earthquake from CWA (Central Weather Administration, 交通部中央氣象署)

prefix=Lect04D
gmt gmtset FORMAT_GEO_MAP ddd:mm:ssF
gmt gmtset FONT_LABEL 10p MAP_ANNOT_OFFSET_PRIMARY 0.075i MAP_LABEL_OFFSET 0.085i MAP_FRAME_WIDTH 0.045i MAP_TICK_LENGTH_PRIMARY 0.080i
gmt gmtset PS_CHAR_ENCODING Standard+

grd1=Taiwan40m_WGS84.nc
grd2=tw_sw40.grd

echo x1=120.1，x2=120.8，y1=22.6，y2=23.2
x1=120.100109867
x2=120.799833826
y1=22.5998854948
y2=23.1999444835
range=${x1}/${x2}/${y1}/${y2}

gmt grdinfo $grd1 > Taiwan40m_WGS84.info
cat Taiwan40m_WGS84.info
gmt grdcut $grd1 -G$grd2 -R$range -V
gmt makecpt -H -Cgray -T0/4000/500 -I -N > topo_gray.cpt
cat << END >> topo_gray.cpt
B	white
F	black
N	204 255 255
END

gmt begin $prefix jpg A+m0.5c
gmt basemap -JM121/23/15c -R$range -Y5c -V -Bxa0.2f0.1 -Bya0.2f0.1 -BWeSn+t'Meinong earthquake, aftershocks and seismicity' \
--FONT_TITLE=18p,16,blue --MAP_TITLE_OFFSET=2p 
gmt grdimage $grd2 -Ctopo_gray.cpt -I+a300-V
gmt makecpt -Cbathy -H  -T-40/0/10 -Z > fd_blue.cpt -V 
gmt makecpt -Cbathy -H  -T0/40/10 -Z -I > fd_blue+.cpt -V 
gmt makecpt -Chot -H  -T-40/0/10 -Z > fd_hot.cpt -V 
gmt makecpt -Chot -H -T0/40/10 -Z -I > fd_hot+.cpt -V 

echo "background seismiity...."
awk '{if ($4 > 2) print $1, $2, -$3, $4}' CWAEQs_1995-2022.txt > EQs_1995-2022.gmt
awk '{if ($4 >= 3 && $4 < 4) print $1, $2, $3, $4 }' EQs_1995-2022.gmt | gmt plot  -Sc0.2c -Cfd_blue+.cpt -W0.01 -V
awk '{if ($4 >= 4 && $4 < 5) print $1, $2, $3, $4 }' EQs_1995-2022.gmt | gmt plot  -Sc0.3c -Cfd_blue+.cpt -W0.01 -V
awk '{if ($4 >= 5 && $4 < 6) print $1, $2, $3, $4 }' EQs_1995-2022.gmt | gmt plot  -Sc0.4c -Cfd_blue+.cpt -W0.01 -V
awk '{if ($4 >= 6 && $4 < 9) print $1, $2, $3, $4 }' EQs_1995-2022.gmt | gmt plot  -Sc0.5c -Cfd_blue+.cpt -W0.01 -V

awk '{if ($4 >= 2 && $4 < 3) print $1, $2, $3, $4 }' Meinong.txt | gmt plot  -Sa0.2c -Cfd_hot+.cpt -W0.01 -V
awk '{if ($4 >= 3 && $4 < 4) print $1, $2, $3, $4 }' Meinong.txt | gmt plot  -Sa0.3c -Cfd_hot+.cpt -W0.01 -V
awk '{if ($4 >= 4 && $4 < 5) print $1, $2, $3, $4 }' Meinong.txt | gmt plot  -Sa0.4c -Cfd_hot+.cpt -W0.01 -V
awk '{if ($4 >= 5 && $4 < 6) print $1, $2, $3, $4 }' Meinong.txt | gmt plot  -Sa0.5c -Cfd_hot+.cpt -W0.01 -V
awk '{if ($4 >= 6 && $4 < 9) print $1, $2, $3, $4 }' Meinong.txt | gmt plot  -Sa0.6c -Cfd_hot+.cpt -W0.01 -V

echo "Active faults (CGS, 2010) and Lungchung fault"
gmt plot ActiveFaults_CGS2010_WGS84.txt -W1.5p,black -V
gmt plot LCNF.txt -W1.5p,black,- -V

# ======epicenters =====
echo 120.54 22.93 16 6.11 | gmt plot -Sa0.6c -Cfd_hot+.cpt -W0.01 -V
echo 120.25 22.96 29 3.63 | gmt plot -Sa0.3c -Cfd_hot+.cpt -W0.01 -V
echo 120.33	23.07 2 6.1 | gmt plot -Sc0.5c -Cfd_blue+.cpt -W0.01 -V
echo 120.73	23 5 6.4 | gmt plot -Sc0.5c -Cfd_blue+.cpt -W0.01 -V 
echo 120.78	22.74 15 5.4 | gmt plot -Sc0.4c -Cfd_blue+.cpt -W0.01 -V

# ======= Plot Scale Text ====================
echo 120.20 22.55 3 50 | gmt plot -Sc0.2c -Cfd_blue+.cpt -W0.01 -V -N
echo 120.24 22.55 4 50 | gmt plot -Sc0.3c -Cfd_blue+.cpt -W0.01 -V -N
echo 120.28 22.55 5 50 | gmt plot -Sc0.4c -Cfd_blue+.cpt -W0.01 -V -N
echo 120.33 22.55 6 50 | gmt plot -Sc0.5c -Cfd_blue+.cpt -W0.01 -V -N

echo 120.16 22.515 2 | gmt plot -Sa0.2c -Cfd_hot+.cpt -W0.01 -V -N
echo 120.20 22.515 3 | gmt plot -Sa0.3c -Cfd_hot+.cpt -W0.01 -V -N
echo 120.24 22.515 4 | gmt plot -Sa0.4c -Cfd_hot+.cpt -W0.01 -V -N
echo 120.28 22.515 5 | gmt plot -Sa0.5c -Cfd_hot+.cpt -W0.01 -V -N
echo 120.33 22.515 6 | gmt plot -Sa0.6c -Cfd_hot+.cpt -W0.01 -V -N

echo 120.1 22.48 M@-L@- | gmt text -F+f14p,Helvetica+jCM -V -N
echo 120.13 22.48 = | gmt text -F+f14p,Helvetica+jCM -V -N
echo 120.16 22.48 2 | gmt text -F+f14p,Helvetica+jCM -V -N
echo 120.20 22.48 3 | gmt text -F+f14p,Helvetica+jCM -V -N
echo 120.24 22.48 4 | gmt text -F+f14p,Helvetica+jCM -V -N
echo 120.28 22.48 5 | gmt text -F+f14p,Helvetica+jCM -V -N

echo 120.33 22.48 6@~\255@~ | gmt text -F+f14p,Helvetica+jCM -V -N
gmt colorbar -Ctopo_gray.cpt -Dx10.5c/-1.7c+w4.5c/0.3c+h -By+l'm' -Bxa1000f500+l'Elevation' -V
gmt colorbar -Cfd_blue+.cpt -Dx5.5c/-1.3c+w4.5c/0.3c+h -B0 -Bf5 -V
gmt colorbar -Cfd_hot+.cpt -Dx5.5c/-2.1c+w4.5c/0.3c+h -Ba10f5+l'Focal Depth (km)' -V

rm *.gmt *.conf *.grd