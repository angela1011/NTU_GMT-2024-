#!/bin/bash

gmt begin Hw01b_IYun_WTO png
 gmt set FONT_TITLE 18p,Times-Roman,blue
 gmt basemap -Rg -JA75/55/3.5i -B+t"WTO" 
 gmt coast -Rg -JA75/55/3.5i -Bg -Dc -A1000 -Glightgray -EAR,AU,AT,BE,BF,BR,BN,BG,CA,CL,CN,CO,CR,CI,HR,CU,CY,CZ,DK,DO,EC,EG,SV,FI,FR,DE,GH,GR,GT,HT,HN,HK,HU,IS,IN,ID,IE,IL,IT,JM,JP,JO,KE,KR,KW,KY,LB,LU,MO,MY,MT,MX,MA,MM,NL,NZ,NI,NE,NG,NO,PK,PA,PY,PE,PH,PL,PT,QA,RO,RU,RW,SN,SG,SK,ZA,ES,LK,SR,SE,CH,TW,TH,TT,TN,TR,AE,GB,US,UY,VE,ZW+gdarkgreen
gmt end

gmt begin Hw01b_IYun_NATO png
 gmt set FONT_TITLE 18p,Times-Roman,blue
 gmt basemap -Rg -JA330/60/3.5i -B+t"NATO"
 gmt coast -Rg -JA330/60/3.5i -Bg -Dc -A1000 -Glightgray -EUS,CA,BE,FR,LU,NL,DK,IS,NO,IT,PT,UK,GR,TR,DE,ES,CZ,HU,PL,BG,EE,LV,LT,RO,SK,SI,AL,HR,MK+gdarkgreen 
gmt end