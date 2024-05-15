# Original batch file was created Chiu Chun-Ying (邱俊穎) on 7 August 2007 for training course of GMT at Geodesy and #ote Sensing Lab, NTU
# Batch file is modified by Hu Jyr-Ching, Department of Geosciences, NTU
gmt set FORMAT_GEO_MAP ddd:mm:ssG

prefix=Lect06B
range=119/123/21/26
grd1=../grdfiles/tw80m.nc
grd2=../grdfiles/Taidp200m.nc
int1=tw30m_aster.nc.int
int2=Taidp200m.nc.int
cpt=topo_compo.cpt

#  ======= Make a composite cpt with two master cpt =======
gmt makecpt -Cocean -T-8000/0/250 -N  > $cpt
gmt makecpt -Cdem2 -T0/4000/250   >> $cpt

# ======= Make gray-scale for focal depth and plot scale bar =======
gmt makecpt -Cgray -T-50/0/5  -Z  > fd_gray.cpt -V 
gmt makecpt -Cgray -T0/50/5 -Z -I > fd_gray+.cpt -V

# ======= Plot a basemap =======

gmt begin $prefix jpg A+m0.5c
	gmt basemap -R$range -JM121/15c -Ba1f0.5 -BWeSn -V
	gmt grdimage $grd2 -C$cpt  -I+d -V
	
    # ======= Using gmt pscoast to clip dry area and fill in 30 m DEM =======
	gmt coast -Df -Gc -V
    gmt grdimage $grd1 -C$cpt -I+d -V
    gmt coast -Q -V
    gmt coast -Df -W1.2p,black -V
	gmt colorbar -C$cpt -Dx7c/-1.7c+w16c/0.3c+jTC+h+e+ml -I -Bxa1000f500g500+l"Elevation (30 m DEM inland, 200 m offshore)" -By+lm -V
	gmt colorbar -Cfd_gray.cpt -Dx0.5c/1.2c+w3c/0.3c -Bxa10f5 -By+lKm -N -V 
	
    #  ======= Add active faults =======
	fault11=Category_I_WGS84.gmt
	fault12=Category_I_concealed_WGS84.gmt
	fault21=Category_II_WGS84.gmt
	#=====fault22=Category_II_concealed_WGS84.gmt
    	gmt plot $fault11 -W0.5p,red -V
	gmt plot $fault12 -W0.5p,red,- -V
	gmt plot $fault21 -W0.5p,green -V
	gmt plot $fault22 -W0.5p,black,- -V
	
    # ======= Plot title string =======
	echo 121 26.25 20,2 MC Focal Mechanisms with Sa and Sm conventions \(M@-w@- \076 6\)|gmt text -F+f+j -N -V
	
    #  ======= Plot scale of focal mechanisms =======
	echo 121.2 25.5 > frame
	echo 121.2 26.0 >> frame
	echo 122.8 26.0 >> frame
	echo 122.8 25.5 >> frame
	echo 121.2 25.5 >> frame
	gmt plot frame -G255 -W.5p -D0.1p/0.1p -V <<- END
	echo 121.2 25.5
	echo 121.2 26.0
	echo 122.8 26.0
	echo 122.8 25.5
	echo 121.2 25.5
	END

	echo 121.4 25.7 0 90.00 90.00   0.00 6.0 121.4 25.7 M=6.0 | gmt meca -Sa0.8c -G125  -N -L1 -V
	echo 121.8 25.7 0  0.00 45.00 -90.00 6.5 121.8 25.7 6.5   | gmt meca -Sa0.8c -G125  -N -L1 -V
	echo 122.2 25.7 0  0.00 45.00  90.00 7.0 122.2 25.7 7.0   | gmt meca -Sa0.8c -G125  -N -L1 -V
	echo 122.6 25.7 0  0.00 45.00  45.00 7.5 122.6 25.7 7.5   | gmt meca -Sa0.8c -G125  -N -L1 -V
	
# ======= Plot epicenters of earthquakes with star symbols =======
# gmt plot eq1977_2005_6.txt -Sa0.2c -G255/0/0 -W1 -V

# ======= Plot focal mechanisms with Aki and Richard convention Sa =======
	gmt meca tweq1995_2005\(sa\).txt -Sa0.8c+u -Zfd_gray+.cpt  -h1 -C0.1 -N -L -V
# ======= Plot focal mechanisms with Harvard CMT seismic moment tensor convention Sm =======
	gmt meca tweq1977_1995\(sm\).txt -Sm0.8c+f8p+o3p -Zfd_gray+.cpt -C0.1 -h1 -N -L -V
gmt end

rm *.conf frame