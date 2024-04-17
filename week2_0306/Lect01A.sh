#!/bin/bash

gmt begin Lect01A -V
 gmt set MAP_GRID_CROSS_SIZE_PRIMARY 0
 gmt coast -R110/140/20/35 -JB125/20/25/45/5i -Bag -Dl -Ggreen -Wthinnest -A250 -V
gmt end

gmt begin Lect01A png
 gmt set MAP_GRID_CROSS_SIZE_PRIMARY 14p,Time-bold,red
 gmt coast -R110/140/20/35 -JB125/20/25/45/5i -Bag -Dl -Ggreen -Wthinnest -A250 -V
gmt end