REM Original batch file was created by Ying-Ping Kuo (郭鶯萍) at Department of Geoscicences, National Taiwan University
REM Background seismicity and aftershocks of Meinong earthquake from Central Weather Bureau (CWB)
REM Edited by Bo-Han Tsao, Department of Geosciences, NTU for GMT 6.0

REM set variables
set prefix=Lect09E
set grd=c:/gridfiles/Taiwan40m_WGS84.nc
set outgrid=tw_sw40.grd
echo x1=120.1，x2=120.8，y1=22.6，y2=23.2
set x1=120.100109867
set x2=120.799833826
set y1=22.5998854948
set y2=23.1999444835
set range=%x1%/%x2%/%y1%/%y2%
REM configure
gmt set FONT_LABEL=10p MAP_ANNOT_OFFSET_PRIMARY=0.075i MAP_LABEL_OFFSET=0.085i MAP_FRAME_WIDTH=0.045i MAP_TICK_LENGTH_PRIMARY=0.080i
gmt set FORMAT_GEO_MAP=ddd:mm:ssG
gmt set PS_CHAR_ENCODING=Standard+
REM cut grd
gmt grdcut %grd% -G%outgrid% -R%range% -V
REM make cpt
gmt makecpt -Cgray -T0/4000/500 -I -N > topo_gray.cpt
echo B	white >> topo_gray.cpt
echo F	black >> topo_gray.cpt
echo N	204 255 255 >> topo_gray.cpt
gmt makecpt -Cbathy -T-20/0/2 -N > vertical.cpt
gmt makecpt -Chot -T0/10/2 -I >> vertical.cpt
REM gmt plot
gmt begin %prefix% tif A+m0.5c
    REM create basemap
    gmt basemap -Jm121.0/22 -R%range% -Bxa0.2f0.1 -Bya0.2f0.1 -BWeSn+t"Deformation Rate from Precise Leveling in SW Taiwan" --FONT_TITLE=18p,16,blue --MAP_TITLE_OFFSET=2p -V
    gmt grdimage %outgrid% -Ctopo_gray.cpt -I+a300+ne0.8 -V
    
    REM Plot active faults (CGS, 2010) and Lungchung fault
    gmt plot ActiveFaults_CGS2010_WGS84.txt -W1.5p,gray0 -V
    gmt plot LCNF.txt -W1.5p,gray1,- -V
    
    REM Plot uplift and subsidence
    gmt plot leveling_s.txt -Si -Cvertical.cpt -W0.2p,gray0 -V
    gmt plot leveling_u.txt -St -Cvertical.cpt -W0.2p,gray0 -V
    
    REM plot scale bar for topography
    gmt colorbar -Ctopo_gray.cpt -Dx0.3c/1.5c+w2.5c/0.15c -By+l"m" -Bxa1000f500+l"Elevation" -V
    
    REM Plot scale bar for vertical deformation rate
    gmt colorbar -Cvertical.cpt -Dx8c/-1.9c+w6.5c/0.3c+h+e -B10+l"vertical deformation rate (mm/yr)" -V
    
    echo 120.16 22.55 2 | gmt plot -St0.2i -Gblack -W0.01i -N -V
    echo 120.16 22.515 2 | gmt plot -Si0.2i -Gblack -W0.01i -N -V
    echo 120.28 22.55 Uplift | gmt text -F+f14p,Helvetica+jCM -N -V
    echo 120.28 22.515 subsidence | gmt text -F+f14p,Helvetica+jCM -N -V
gmt end show
REM finale
del *.int *.conf *.grd
pause








