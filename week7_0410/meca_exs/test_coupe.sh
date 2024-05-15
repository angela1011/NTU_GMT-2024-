#!/usr/bin/env bash
gmt begin profile
gmt coupe -JX15c/-6c -Sd0.8 -Aa130/43/140/36+d90+r -Gblack -Q -N << EOF
131.55 41.48 579  1.14 -0.10 -1.04 -0.51 -2.21 -0.99 26 X Y
133.74 41.97 604  6.19 -1.14 -5.05 -0.72 -9.03 -4.24 25 X Y
135.52 37.64 432  0.95  0.11 -1.06 -0.20 -2.32  0.90 25 X Y
138.37 42.85 248 -2.49  3.40 -0.91  3.09  0.83 -3.64 25 X Y
EOF
gmt basemap -BWS -Byaf+l"Focal depth (km)" -Bxaf+l"Distance (km)"
gmt end show