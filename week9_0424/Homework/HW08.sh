prefix=HW08
range=137.5/143.5/35/42
vel="./GSI_Japan/velocity-jp.txt"
# data="SCEC_gps_vel.txt"
data="SCEC.txt"
# vel="./GPSVEL_UNAVCO/1.0/gpsvel_1.0_cfa.gmt"
# Coseismic="./Tohoku\ earthquake/__coseis.lst"

gmt begin $prefix jpg A+m0.5c
  gmt grdimage @earth_relief_15s.grd -R$range -BWSen+t"R12224203" -Ba1f0.5 -I+d -V 
  # gmt plot $data -St0.05 -Gred -V
  # gmt velo $data -Se0.02c/0.39/3 -A0.1+e -W0.5p,black -Gblack -V
  gmt coast -Df -W0.5 -V 
  gmt plot $data -St0.1 -Gred -V
  gmt velo $data -Se0.1/0.1/0.1 -A0.1+e -W0.3p,blue -Gblue -V
gmt end

# rm *.conf *.info