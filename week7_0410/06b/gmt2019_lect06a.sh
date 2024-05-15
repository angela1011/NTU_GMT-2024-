# Original batch file was created Chiu Chun-Ying (邱俊穎) on 7 August 2007 for training course of GMT at Geodesy and #ote Sensing Lab, NTU
# Batch file is modified by Hu Jyr-Ching, Department of Geosciences, NTU

gmt set FORMAT_GEO_MAP ddd:mm:ssF
ps=gmt_lect06a.ps
range=119/123/21/26
grid1=../../gridfiles/tw30m_aster.nc
grid2=../../gridfiles/Taidp200m.nc
int1=tw30m_aster.nc.int
int2=Taidp200m.nc.int
cpt=topo_compo.cpt 

# ======= Make a composite cpt with two master cpt =======
gmt makecpt -Cocean -T-8000/0/250 -N > ${cpt}
gmt makecpt -Cdem2 -T0/4000/250 >> ${cpt}

# ======= Plot a basemap =======
#gmt grdgradient ${grid1} -Nt1 -A320 -G${int1} -V
#gmt grdgradient ${grid2} -Nt1 -A320 -G${int2} -V
gmt psbasemap -R${range} -JM15c -Bxa1f0.5 -Bya1f0.5 -BWeSn -Y2i -P -K -V > ${ps}
gmt grdimage ${grid2} -R -JM -C${cpt} -I${int2} -O -K -P -V >> ${ps}

# ======= Using gmt pscoast to clip dry area and fill in 30 m DEM =======
gmt pscoast -R -JM -O -K -Df -Gc -V >> ${ps}
gmt grdimage ${grid1} -R -JM -C${cpt} -I${int1} -O -K -P -V >> ${ps}
gmt pscoast -R -JM -O -K -Q >> ${ps}

# ======= Add active faults =======
fault11=CategoI_WGS84_CGS2012.gmt
fault12=CategoI_concealed_WGS84_CGS2012.gmt
fault21=CategoII_WGS84_CGS2012.gmt
fault22=CategoII_concealed_WGS84_CGS2012.gmt
gmt psxy ${fault11} -JM -R -W0.5p,red -O -P -K -V >> ${ps}
gmt psxy ${fault12} -JM -R -W0.5p,red,- -O -P -K -V >> ${ps}
gmt psxy ${fault21} -JM -R -W0.5p,green -O -P -K -V >> ${ps}
gmt psxy ${fault22} -JM -R -W0.5p,black,- -O -P -K -V >> ${ps}

# ======= Plot title string =======
echo 121 26.25 20,2 MC "Focal Mechanisms with Sa and Sm conventions (M@-w@- \076 6)"|gmt pstext -JM -R -F+f+j -N -P -O -K -V >> ${ps}

# ======= Plot scale of focal mechanisms =======
echo 121.2 25.5 > frame
echo 121.2 26.0 >> frame
echo 122.8 26.0 >> frame
echo 122.8 25.5 >> frame
echo 121.2 25.5 >> frame
gmt psxy frame -R -JM -G255 -W.5p -D.1p/.1p -P -V -K -O >> ${ps}
echo 121.4 25.7 0 90.00 90.00 0.00 6.0 121.4 25.7 M=6.0 | gmt psmeca -JM -R -Sa.8/10/3 -G125 -C -N -L -P -O -K -V >> ${ps}
echo 121.8 25.7 0 0.00 45.00 -90.00 6.5 121.8 25.7 6.5 | gmt psmeca -JM -R -Sa.8/10/3 -G125 -C -N -L -P -O -K -V >> ${ps}
echo 122.2 25.7 0 0.00 45.00 90.00 7.0 122.2 25.7 7.0 | gmt psmeca -JM -R -Sa.8/10/3 -G125 -C -N -L -P -O -K -V >> ${ps}
echo 122.6 25.7 0 0.00 45.00 45.00 7.5 122.6 25.7 7.5 | gmt psmeca -JM -R -Sa.8/10/3 -G125 -C -N -L -P -O -K -V >> ${ps}

# ======= Plot epicenters of earthquakes =======
gmt psxy eq1977_2005_6.txt -JM -R -Sa0.2 -G255/0/0 -W1 -P -O -K -V >> ${ps}

# ======= Make gray-scale for focal depth and plot scale bar =======
gmt makecpt -Cgray -T-50/0/5 -Z > fd_gray.cpt -V 
gmt makecpt -Cgray -T0/50/5 -Z -I > fd_gray+.cpt -V
gmt psscale -Cfd_gray.cpt -Dx0.5c/1.2c+w3c/0.3c -Bxa10f5 -By+lKm -N -P -O -K -V  >> ${ps}

# ======= Plot focal mechanisms with Aki and Richard convention Sa =======
gmt psmeca "tweq1995_2005(sa).txt" -JM -R -Sa0.8/10/3 -Zfd_gray+.cpt -C -h1 -N -L -P -O -K -V >> ${ps}
# ======= Plot focal mechanisms with Harvard CMT seismic moment tenso Sm =======
gmt psmeca "tweq1977_1995(sm).txt" -JM -R -Sm0.8/10/3 -Zfd_gray+.cpt -C -h1 -N -L -P -O -K -V >> ${ps}

# ======= Plot color-coded scale for elevation =======
gmt psscale -C${cpt} -Dx0.5c/-1.5c+w15c/0.25c+jTL+h+e -S -I -Bx1000+l"Elevation (30 m DEM inland, 200 m offshore)" -By+lm -P -O -K -V >> ${ps}

# ======= Terminate a sequence of GMT plotting commands without producing any plotting output ====================
gmt psxy -R -J -T -O >> ${ps}

# ======= Convert PS files to raster image ====================
gmt psconvert ${ps} -Tt -A1i -P -Z


rm *.int *.conf *.history
rm frame

