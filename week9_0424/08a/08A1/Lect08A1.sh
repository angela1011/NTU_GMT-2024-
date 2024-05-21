#!/bin/bash
gmt begin Lect08A1 jpg
gmt velo -R-10/10/-10/10 -Wthin,red -Se0.2c/0.39+f12 -Ba2g1 \
-BWeSn -Jx0.2i -Ggreen -Eblue -L -N  << EOF
# Long. Lat. Evel Nvel Esig Nsig CorEN SITE
# (deg) (deg) (mm/yr) (mm/yr)
-7. 0. 5.0 0.0 2.0 3.0 0.500 NTU1
-4. 0. 0.0 5.0 2.0 3.0 0.500 NTU2
-3. 5. -5.0 0.0 2.0 3.0 0.500 NTU3
-8. 5. 0.0 -5.0 0.0 0.0 0.500 NTU4
-1. 7. 3.0 3.0 1.0 1.0 0.100 NTU5
EOF
gmt velo -Se0.2c/0.39+f14 -A0.25c+p0.25p+e << EOF
# Long. Lat. Evel Nvel Esig Nsig CorEN SITE
# (deg) (deg) (mm/yr) (mm/yr)
0. -8. 0.0 0.0 2.0 3.0 0.100 NTU6
-7. 7. 3.0 3.0 0.0 0.0 0.200 NTU7
0. 2. 4.0 6.0 2.0 3.0 0.300 NTU8
-5. -5. 6.0 2.0 3.0 4.0 0.400 NTU9
7. 0. -6.0 2.0 3.0 2.0 -0.300 NTU0
3. -4. 6.0 -4.0 3.0 2.0 -0.500 NTUA
EOF
gmt end