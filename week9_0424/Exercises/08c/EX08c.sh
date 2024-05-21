
prefix=EX08c
grd=tw30m_aster.nc
data="coseismic_Nevada.txt" 

range=119.5/122.2/21.5/25.5
gmt begin $prefix jpg A+m0.5i
# plot basemap with 40 m DEM
    gmt grd2cpt $grd -L0/4000 -T0/4000/200 -Z -Cdem3
    gmt basemap -Bxa1f0.5 -Bya1f0.5 -BWeSn -R$range -Jm121.0/1.8 -X1 -V
    gmt grdimage $grd -CGray -I+a45+ne1.0 -V
# plot administration boundaries
    gmt plot Taiwan_county_WGS84.gmt -W0.3p,azure -V
    gmt coast -Df -W0.3p,0 -Slightcyan -V
    # gmt colorbar -C -Dx3.1/-0.5+w6.0/0.1+jTC+h+e -Bx500 -By+lm -I -V
    gmt plot $data -St0.05 -Gred -V
    gmt velo $data -Se0.01/0.1/0.1 -A0.1+e -W0.3p,blue -Gblue -V
#-Se0.01/0.1/0.1 #-Se0.2c/0.39+f12
# Plot active faults 
    fault11=Category_I_WGS84.gmt
    fault12=Category_I_concealed_WGS84.gmt
    fault21=Category_II_WGS84.gmt
    fault22=Category_II_concealed_WGS84.gmt
    gmt plot $fault11 -W0.5p,blue -V
    gmt plot $fault12 -W0.5p,blue,- -V
    gmt plot $fault21 -W0.5p,black -V
    gmt plot $fault22 -W0.5p,black,- -v

gmt end
# rm *.history *.conf
