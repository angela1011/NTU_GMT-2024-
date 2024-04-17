#!/bin/bash

gmt begin Hw01a_IYun png
 gmt set MAP_FRAME_TYPE = fancy+
 gmt basemap -R-25/55/-40/40 -Jm15/0/0.06i -Ba10f5 -BWSNE+t"r12224203_IYun"
 gmt coast -R-25/55/-40/40 -Glightgray -N1/0.25p,- -W1/0.5p,black -U -V -ESL,AF,LR,AN,AF+gtomato -EGN+gred -ENG,ML+glightpink -ESN,IN+glightgreen
gmt end