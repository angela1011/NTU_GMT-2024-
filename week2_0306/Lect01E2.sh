#!/usr/bin/env -S bash -e
# Plot positioning and layout: The -X -Y options

gmt begin Lect04E2
        gmt basemap -JX4c/2c -R0/4/0/2 -Ba1f0.5 -V
        gmt basemap -Ba1f0.5 -Xw+2c -V
        gmt basemap -Ba1f0.5 -X-w-2c -Yh+2c -V
        gmt basemap -Ba1f0.5 -Xw+2c -V
gmt end
