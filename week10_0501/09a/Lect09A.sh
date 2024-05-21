# Numerical Sandbox: PFC2D provided by Wang Fang-Lin
# Original batch file was made by Chiu Chun-Ying, Department of Geosciences, NTU
# Batch file modified by Jyr-Ching Hu, Department of Geosciences, NTU 
# Edited by Bo-Han Tsao, Department of Geosciences, NTU for GMT6.0

# ======= Set variables =======
prefix=Lect09A
# ======= Configuration =======
gmt set PROJ_LENGTH_UNIT=inch
# ======= Data Processing
awk '{print $2, $3, sqrt($4*$4+$5*$5)}' pinfo.txt | gmt nearneighbor -Gxy.grd -R-118/-45/-5/5 -I0.1/0.1 -N4 -S0.48 -ENaN -V
grdinfo xy.grd  > xy.grd.info
cat xy.grd.info
# ======= make cpt file =======
gmt grd2cpt xy.grd  -Crainbow -Fr -N -Z > xy.cpt -V
# echo N 255  255  255 >> xy.cpt
cat xy.cpt
# gmt plot
gmt begin $prefix tif,png A+m0.5c
    # ======== Plot lowr pannel ========
	awk '{print $2, $3, sqrt($4*$4+$5*$5)}' pinfo.txt | gmt plot -Jx0.12 -R-118/-45/-5/5 -Sc0.07 -W0.01 -Cxy.cpt -Bx10+l"Distance (km)" -By2+l"Height (km)" -BWeSn 
    gmt colorbar -Dx9i/0.8i+w5.5c/0.3c+e+jCM -Cxy.cpt -Bx1+l"Velocity" -By+l"cm/yr" -V
	# ======== Plot upper pannel =========
	gmt grdimage xy.grd -Jx0.12 -Cxy.cpt -Bx10+l"Distance (km)" -By2+l"Height (km)" -BWeSn -Y3 -V
    gmt colorbar -Dx9i/0.8i+w5.5c/0.3c+e+jCM -Cxy.cpt -Bx1+l"Velocity" -By+l"cm/yr" -V
gmt end
# delete
rm *.conf *.history



