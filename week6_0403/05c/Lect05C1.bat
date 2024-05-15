REM Taiwan transportation network
REM Modified by Bo-Han Tsao in GMT6 

set prefix=Lect05C1
set grd=c:/gridfiles/tw30m_aster.nc
set range=119.4/122.4/21.6/25.5
set cpt=tw_gray.cpt

gmt gmtset FORMAT_GEO_MAP ddd:mm:ssF
gmt gmtset FONT_LABEL 10p MAP_ANNOT_OFFSET_PRIMARY 0.075i MAP_LABEL_OFFSET 0.085i MAP_FRAME_WIDTH 0.045i MAP_TICK_LENGTH_PRIMARY 0.080i
gmt gmtset PS_CHAR_ENCODING Standard+

gmt grdinfo %grd% > tw30m_aster.info
type tw30m_aster.info

REM make color palette table
gmt makecpt -Cgray -T0/4000 -Z -I -N > %cpt%
echo B	white >> %cpt%
echo F	black >> %cpt%
echo N	204 255 255 >> %cpt%

gmt begin %prefix% jpg A+m0.5c
    REM basemap
    gmt basemap -JM121.0/15 -R%range% -Ba1f0.5 -BWeSn+t"Transportation Network in Taiwan" --FONT_TITLE=18p,16,blue --MAP_TITLE_OFFSET=2p -Y5c -V
    gmt grdimage %grd% -C%cpt% -I+a310+ne1.0 -V
    gmt coast -Df -W0.3p,0 -Slightcyan -V
    
    REM set county boundary 
    gmt plot Taiwan_county_WGS84.gmt -W0.4p,azure -V
    
    REM Transportation network 
    gmt plot Highway_Prov.gmt -W0.5p,forestgreen -V
    gmt plot Freeway_Nat.gmt -W1.5p,peachpuff4 -V
    gmt plot TRA.gmt -W2.5p,white -V
    gmt plot TRA.gmt -W2.5p,black,4_4:2p -V
    gmt plot THSRC.gmt -W3p,red -V
    gmt plot THSRC.gmt -W3p,black,6_6:3p -V
    
    REM  Set legend
    echo 119.82 25.25 > inset
    echo 119.82 24.75 >> inset
    echo 120.75 24.75 >> inset
    echo 120.75 25.25 >> inset
    gmt plot inset -W1.5p -L -Givory -V
    echo 119.86 25.15 > tmp
    echo 119.96 25.15 >> tmp
    gmt plot tmp -W2.5p,forestgreen -V
    echo 120.00 25.15 Provincial Highway | gmt text -F+f12+jML -V
    echo 119.86 25.05 > tmp
    echo 119.96 25.05 >> tmp
    gmt plot tmp -W2.5,peachpuff4 -V
    echo 120.00 25.05 National Freeway | gmt text -F+f12+jML -V
    echo 119.86 24.95 > tmp
    echo 119.96 24.95 >> tmp
    gmt plot tmp -W2.5p,white -V
    gmt plot tmp -W2.5p,black,4_4:0p -V
    echo 120.00 24.95 TRA Rail | gmt text -F+f12+jML -V
    echo 119.86 24.85 > tmp
    echo 119.96 24.85 >> tmp
    gmt plot tmp -W2.5p,red -V
    gmt plot tmp -W2.5p,black,4_4:0p -V
    echo 120.00 24.85 THSRC Rail | gmt text -F+f12+jML -V
    
    REM set color-coded scale
    gmt colorbar -C%cpt% -Dx7.5/-1.0+w14.0/0.25+h+jTC -By+l"m" -Bxa1000f500+l"Elevation" -V
gmt end
del *.conf
pause