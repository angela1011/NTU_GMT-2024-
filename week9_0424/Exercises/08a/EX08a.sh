# Taiwan base map with active faults
# Active faults data: Lin et al., 2010, Central Geological Survey, MOEA.
# Origianl batch file was created by Ying-Hung Tung (���^��)
# Jyr-Ching Hu in GMT6 modules

prefix=EX08a
grd=tw30m_aster.nc
data="2003-2005.txt" 

range=118.7/122.2/21.5/25.5
gmt begin $prefix jpg A+m0.5i
# plot basemap with 40 m DEM
    gmt grd2cpt $grd -L0/4000 -T0/4000/200 -Z -Cdem3
    gmt basemap -Bxa1f0.5 -Bya1f0.5 -BWeSn+t"R12224203" -R$range -Jm121.0/1.8 -X1 -V
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
    gmt plot $fault11 -W0.5p,red -V
    gmt plot $fault12 -W0.5p,red,- -V
    gmt plot $fault21 -W0.5p,green -V
    gmt plot $fault22 -W0.5p,black,- -v

    echo 119.2  22.9 > legend1
    echo 119.5  22.9 >> legend1
    echo 119.2  22.8 > legend2
    echo 119.5  22.8 >> legend2
    echo 119.2  22.7 > legend3
    echo 119.5  22.7 >> legend3
    gmt plot legend1 -W0.5p,green -V
    gmt plot legend2 -W0.5p,gray -V
    gmt plot legend3 -W0.5p,blue -V
    echo 119.60 22.90 'After 0305EQ' | gmt text -F+f8p,Helvetica,0+jLB -V
    echo 119.60 22.80 'After 1210EQ' | gmt text -F+f8p,Helvetica,0+jLB -V
    echo 119.60 22.70 '2023-2025' | gmt text -F+f8p,Helvetica,0+jLB -V

gmt inset begin -DjBL+w1.5i/1.5i+o0.1i/0.1i -M0.002i
gmt basemap -R117.5/122.5/21.6/26.5 -BWESN -Gwhite -V
gmt coast -W0.25p,0 -JM? -Swhite -Gwhite -V
gmt inset end

gmt end
# rm *.history *.conf