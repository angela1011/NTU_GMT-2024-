#!/usr/bin/env -S bash -e
#Plot positioning and layout: -X -Y options
gmt begin Lect01E1
        gmt basemap -JX4c/2c -R0/4/0/2 -Ba1f0.5
        gmt basemap -Ba1f0.5 -Xa6c
        gmt basemap -Ba1f0.5 -Y4c
        gmt basemap -Ba1f0.5 -X6c
gmt end
