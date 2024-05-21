prefix=EX08b
grd=Taidp200m.nc
range=116/126.5/13.5/26.5
data="velyu1999.gmt"

gmt begin $prefix jpg A+m0.5c
  #gmt grd2cpt $grd -Csealand -L-7000/5000 -T-7000/5000/500 -Z 
  # gmt grd2cpt %grd% -Cgeo -T-7000/5000 -L-7000/5000 -Z -V
  #grd2cpt mydata.nc -Crelief -L-10000/8000 -S0/200/20 -Z > mydata.cpt
  gmt grdimage @earth_relief_15s.grd -R$range -BWSen+t"R12224203" -JM123/23/12c -Ba1f0.5 -I+d -V #-Cmydata.cpt
  gmt velo $data -Se0.02c/0.39/3 -A0.1+e -W0.5p,black -Gblack -V
  gmt coast -Df -W1 -V 
  # gmt colorbar -Dx5.7c/-1.2c+w14c/0.5c+h+jTC+ef -By+lm -Bxa2000f500g500+lElevation -I -V
gmt end

# rm *.conf *.info