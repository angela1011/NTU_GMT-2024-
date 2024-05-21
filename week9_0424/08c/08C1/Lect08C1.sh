#!/bin/bash
gmt begin Lect08C1 jpg
# left three wedges
gmt velo -JM15c -R241/242/34/35 -B0.5 -BWeSn+tvelo \
-Sw3c/1.e7 -W1p -G60 -E210 -D2 << EOF
# lon lat spin(rad/yr) spin_sigma (rad/yr)
241.2 34.2 5.65E-08 1.17E-08
241.2 34.5 -4.85E-08 1.85E-08
241.2 34.7 4.46E-09 3.07E-08
EOF
# right three wedges
gmt velo -Sw3c/1.e7 -W1p -D2 << EOF
# lon lat spin(rad/yr) spin_sigma (rad/yr)
241.7 34.2 5.65E-08 1.17E-08
241.7 34.5 -4.85E-08 1.85E-08
241.7 34.7 4.46E-09 3.07E-08
EOF
gmt coast -W1p -Di
gmt end