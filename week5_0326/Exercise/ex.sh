#!/bin/sh

prefix=EX04
# grd=earth_relief_01m.grd
range=85/175/-20/66
# gmt grdcut $grd -G$grd -R$range
gmt makecpt -Cterra.cpt -T-8000/8000/1000 -I -Z > $cpt
gmt begin $prefix png
    #gmt basemap -R$range -JM121/15c -Bxa0.5f0.25 -Bya0.5f0.25 -BWeSn+t"R12224203_Exercise04" -V
    gmt grdimage @earth_relief_01m.grd -R$range -JM6i -C$cpt -I+a60+ne1.0
    gmt coast -W0.1p,0 -S255/255/255 -Lg119.80/24.20+c15+w50+f+lkm -Bx1f0.5 -By1f0.5 -BWSne+t'R12224203_Exercise04' -Df
    gmt plot ridge.gmt -W1.0p,red -V
    gmt plot transform.gmt -W1.0p,blue -V
    gmt plot trench.gmt -W1.0p,green -V
    awk '{print $6,$4}' volcanoes_of_the_world.txt | gmt plot -St0.15c -Gchocolate -W0.1p -V
    echo 102.0 35.0 Eurasian plate | gmt text -R$range -F+f20p,Helvetica-Bold,black -Dj0.1c/0.1c   
    echo 160.0 26.0 Pacific plate | gmt text -R$range -F+f20p,Helvetica-Bold,black -Dj0.1c/0.1c   
    echo 134.2 16.0 Philippine Sea plate | gmt text -R$range -F+f10p,Helvetica-Bold,black -Dj0.1c/0.1c   
    gmt colorbar -C$cpt -Dx8c/1c+w12c/0.5c+jTC+h -I -Bxa2000f500 -By+lm -V -Y-2.5
gmt end