REM Data: SRTM-derived DEM 3.0
REM Batch file created by Jyr-Ching Hu, Department of Geosciences, NTU 
REM Edited by Bo-Han Tsao, Department of Geosciences, NTU for GMT6
REM configure
gmt set FORMAT_GEO_MAP ddd:mm:ssF
gmt set MAP_FRAME_WIDTH 0.1c
gmt set FONT_ANNOT_PRIMARY 10p
gmt set FONT_ANNOT_SECONDARY 8p
REM set variables
set in=tw_srtm30m.tif
set out1=tw_srtm30m.nc
set out2=tw_srtm30m_sf.grd

rem ======= Run grdconvert to convert Geotiff to netCDF and surferformat ==================== 
gmt grdconvert %in%=gd:GTiff -G%out1%=nf -V
gmt grdconvert %in%=gd:GTiff -G%out2%=sf -V
gmt grdinfo %out1% > tw_srtm30m.nc.info
type tw_srtm30m.nc.info
gmt grdinfo %out2% > tw_srtm30m_sf.grd.info
type tw_srtm30m_sf.grd.info

set prefix1=Lect10c1
set prefix2=Lect10c2
set prefix3=Lect10c3
set range=119/123/21/26
REM gmt plot case1
gmt begin %prefix1% tif A+m0.5c
    gmt basemap -Jm121.0/1i -R%range% -B1f0.5
    gmt grd2cpt %out1% -Z -Cdem2 -V
    gmt grdimage %out1% -I+a130+ne0.8 -V
    gmt coast -Df -W0.5p,0 -S132/193/255 -V
    gmt colorbar -Dx2.0i/-0.4i+w4.5i/0.1i+h+e+jCM -Bf1000a500+l"Relief of Taiwan (SRTM-DEM)" ^
    -By+lmeter --FONT_LABEL=12p --FONT_ANNOT_PRIMARY=6p -I -V
gmt end
REM gmt plot case 2
rem ======= case 2, format: Golden Software Surfer format 6 (32-bit float) ====================
gmt begin %prefix2% tif A+m0.5c
    gmt basemap -Jm121.0/1i -R%range% -B1f0.5 -V
    gmt grd2cpt %out2% -Z -Cdem2 -V
    gmt grdimage %out2% -I+a130+ne0.8 -V
    gmt coast -Df -W0.5p,0 -S132/193/255 -V
    gmt colorbar -Dx2.0i/-0.4i+w4.5i/0.1i+h+e+jCM -Bxf1000a500+l"Relief of Taiwan (SRTM-DEM)" ^
    -By+lmeter --FONT_LABEL=12p --FONT_ANNOT_PRIMARY=6p -I -V
gmt end
REM gmt plot case 3
rem ======= Plot Geotiff directly ====================
gmt grdinfo tw_srtm30m.tif > tw_srtm30m.tif.info
type tw_srtm30m.tif.info
gmt begin %prefix3% tif A+m0.5c
    gmt basemap -Jm121.0/1i -R%range% -B1f0.5 -V
    gmt grd2cpt %in% -Z -Cdem2 -V
    gmt grdimage %in% -I+a130+ne0.8 -V
    gmt coast -Df -W0.5p,0 -S132/193/255 -V
    gmt colorbar -Dx2.0i/-0.4i+w4.5i/0.1i+h+e+jCM -S -Bxf1000a500+l"Relief of Taiwan (SRTM-DEM)" ^
    -By+lmeter --FONT_LABEL=12p --FONT_ANNOT_PRIMARY=6p -I -V
gmt end
REM Delete unnecessary files
del *.conf
pause

