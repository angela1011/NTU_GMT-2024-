#!/bin/bash

gmt begin EX10 png
 gmt set MAP_FRAME_TYPE = fancy+
 gmt basemap -R90/150/-15/30 -Jm15/0/0.06i -Ba10f5 -BWSNE+t"r12224203_IYun"
 gmt coast -R90/150/-15/30 -Slightblue -Gwhite -N1/0.25p,- -W1/0.3p,black -U -V -EID,LA,BN+glightgreen -EVN+gtomato  -ETH+gyellow -EMM+gpurple -EKH,SG,ML,TL,PH+glightpink -EMY+gcornflowerblue
gmt end
#ID,VN,LA,BN,TH,MM,PH,KH,SG,MY,TL