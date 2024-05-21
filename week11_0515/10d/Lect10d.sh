set Gtif=twdtm_asterV2_30m.tif
set nc=tw_aster30m.nc
gmt grdconvert $Gtif=gd $nc=ns
gmt grdinfo $nc > tw_aster30m.nc.info

prefix1=Lect10

gmt begin $prefix tif,png A+m0.5c
gmt grd2cpt $nc -L0/4000 -T0/4000/200 -Cdem3 
gmt basemap -Bxa1f0.5 -Bya1f0.5 -BWeSn+t"Active Faults in Taiwan (CGS, 2010)" -R%range% ^ -Jm121.0/1.8 --FONT_TITLE=24p,AvantGarde-Demi,black –V
gmt grdimage $nc -C -I+a45/270+ne0.4 -V
gmt plot Taiwan_county_WGS84.gmt -W0.3p,azure 
gmt coast -Df -W0.3p,0 -Slightcyan -V
gmt colorbar -C -Dx3.1/-0.5/+w6.0/0.1+jTC+h+e  -Bx500 -By+lm 

set fault11=Category_I_WGS84.txt
set fault12=Category_I_concealed_WGS84.txt
set fault21=Category_II_WGS84.txt
set fault22=Category_II_concealed_WGS84.txt
gmt plot $fault11 -W0.5p,red -V
gmt plot $fault12 -W0.5p,red,- -V
gmt plot $fault21 -W0.5p,green -V
gmt plot $fault22 -W0.5p,black,- -V
gawk "{print $1, $2, $3}" fault_num.txt | gmt text -F+f6p,0 -V