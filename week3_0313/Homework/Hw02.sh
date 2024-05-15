#!/bin/bash

gmt begin Hw02_a_IYun png
 gmt coast -R-180/180/-90/90 -JI12c -Bxg30 -Byg30 -Df -A10000 -Gchocolate -Slightgray  -X1.12i
gmt end

gmt begin Hw02_b_IYun png
 gmt grdimage @earth_relief_05m -Rd -JI50c -Ne1 -I+d -Ctopo_sealand.cpt 
 gmt coast -Bxg10 -Byg10 -Bpy10g -BWSNE -Df -W0.01p,black -V
gmt end