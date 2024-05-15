REM Taiwan base map with active faults
REM Active faults data: Lin et al., 2010, Central Geological Survey, MOEA.
REM Origianl batch file was created by Ying-Hung Tung (¸³­^§»)
REM Modified by Bo-Han Tsao and Jyr-Ching Hu in GMT6

set prefix=Lect05B
set grd=c:/gridfiles/tw30m_aster.nc

gmt gmtset FORMAT_GEO_MAP ddd:mm:ssF
gmt gmtset PROJ_LENGTH_UNIT = inch

gmt begin %prefix% jpg A+m0.5i
    gmt grd2cpt %grd% -L0/4000 -T0/4000/200 -Z -Cdem3
    gmt basemap -Bxa1f0.5 -Bya1f0.5 -BWeSn+t"Active Faults in Taiwan (CGS, 2021)" -R118.7/122.2/21.5/25.5 -Jm121.0/1.8 --FONT_TITLE=24p,AvantGarde-Demi,black -X1 -V
    gmt grdimage %grd% -C -I+a45+ne1.0 -V
    
    gmt plot Taiwan_county_WGS84.gmt -W0.3p,azure -V
    gmt coast -Df -W0.3p,0 -Slightcyan -V
    gmt colorbar -C -Dx3.1/-0.5+w6.0/0.1+jTC+h+e -Bx500 -By+lm -I -V
    
    set fault11=Category_I_WGS84.gmt
    set fault12=Category_I_concealed_WGS84.gmt
    set fault21=Category_II_WGS84.gmt
    set fault22=Category_II_concealed_WGS84.gmt

    gmt plot %fault11% -W0.5p,red -V
    gmt plot %fault12% -W0.5p,red,- -V
    gmt plot %fault21% -W0.5p,green -V
    gmt plot %fault22% -W0.5p,black,- -V
    
    gawk "{print $1, $2, $3}" fault_num.txt | gmt text -F+f6p,0 -V
        
    echo 119.2  24.9 > legend1
    echo 119.5  24.9 >> legend1
    echo 119.2  24.8 > legend2
    echo 119.5  24.8 >> legend2
    echo 119.2  24.7 > legend3
    echo 119.5  24.7 >> legend3
    
    gmt plot legend1 -W0.5p,red -V
    gmt plot legend2 -W0.5p,green -V
    gmt plot legend3 -W0.5p,black,- -V
    
    echo 119.50 25.00 Legend | gmt text -F+f8p,Helvetica,0+jCM -V
    echo 119.60 24.90 Category I active faults | gmt text -F+f8p,Helvetica,0+jLB -V
    echo 119.60 24.80 Category II active faults | gmt text -F+f8p,Helvetica,0+jLB -V
    echo 119.60 24.70 Concealed or inferred active faults | gmt text -F+f8p,Helvetica,0+jLB -V
    echo 119.30 24.60 Data Source: Central Geological Survey (2010)| gmt text -F+f8p,Helvetica,black+jLB -V
    
    gawk "{print $1, $2, $3, $4, $5}" fault_nam_ENG.txt | gmt text -F+f8p,Helvetica,black+jLB -V
gmt end
del *.history *.conf
pause

