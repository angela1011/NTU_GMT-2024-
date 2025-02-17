# Example from https://docs.gmt-china.org/6.5/module/meca/
# The size of the beachball changes with magnitude, and the color changes with depth.
# Long Lat focal depth(km) strike dip rake Mag newX newY ID
#!/usr/bin/env bash

gmt begin beachball03 jpg A+m0.5c
gmt basemap -JQ104/15c -R102.5/105.5/30.5/32.5 -Ba -BWSen
gmt coast -Da -Ia/0.05,black
gmt makecpt -T0/100/20
gmt meca -A+s0.2c -Sa1.3c -C << EOF
104.33 31.91 39.8  32 64   85 7.0      0     0 A
104.11 31.52 27.1  22 53   57 6.0      0     0 B
103.67 31.13  6.4  86 32  -65 8.0      0     0 C
103.90 31.34 43.6 194 84  179 4.9 104.18 30.84 D
103.72 31.44 67.3  73 84 -162 4.9 103.12 31.64 E
104.12 31.78 12.7 186 68  107 4.7 103.83 32.26 F
104.23 31.61 62.0  86 63  -51 4.7 104.96 31.69 G
EOF
gmt colorbar -DjBL+w5c/0.5c+ml+o0.8c/0.4c -Bx+lDepth -By+lkm
gmt end show