# Data: SRTM-derived DEM 3.0
# Batch file created by Jyr-Ching Hu, Department of Geosciences, NTU 
# Edited by Bo-Han Tsao, Department of Geosciences, NTU for GMT6
# configure
gmt set FORMAT_GEO_MAP ddd:mm:ssF
gmt set MAP_FRAME_WIDTH 0.1c
gmt set FONT_ANNOT_PRIMARY 10p
gmt set FONT_ANNOT_SECONDARY 8p
# set variables
in=tw_srtm30m.tif
out1=tw_srtm30m.nc
out2=tw_srtm30m_sf.grd

# ======= Run grdconvert to convert Geotiff to netCDF and surferformat ==================== 
gmt grdconvert $in=gd:GTiff -G$out1=nf -V
gmt grdconvert $in=gd:GTiff -G$out2=sf -V
gmt grdinfo $out1 > tw_srtm30m.nc.info
cat tw_srtm30m.nc.info
gmt grdinfo $out2 > tw_srtm30m_sf.grd.info
cat tw_srtm30m_sf.grd.info

prefix1=Lect10C1
prefix2=Lect10C2
prefix3=Lect10C3
grd1=tw_srtm30m.nc
grd2=tw_srtm30m_sf.grd
range=119/123/21/26

# gmt plot case1
gmt begin $prefix1 tif,png A+m0.5c
    gmt basemap -Jm121.0/1i -R$range -B1f0.5
    gmt grd2cpt $grd1 -Z -Cdem2 -V
    gmt grdimage $grd1 -I+a130+ne0.8 -V
    gmt coast -Df -W0.5p,0 -S132/193/255 -V
    gmt colorbar -Dx2.0i/-0.4i+w4.5i/0.1i+h+e+jCM -Bxf1000a500+l"Relief of Taiwan (SRTM-DEM)" /
    -By+l"meter" --FONT_LABEL=12p --FONT_ANNOT_PRIMARY=6p -I -V
gmt end
# gmt plot case 2
# ======= case 2, format: Golden Software Surfer format 6 (32-bit float) ====================
gmt begin $prefix2 tif A+m0.5c
    gmt basemap -Jm121.0/1i -R$range -B1f0.5 -V
    gmt grd2cpt $grd2 -Z -Cdem2 -V
    gmt grdimage $grd2 -I+a130+ne0.8 -V
    gmt coast -Df -W0.5p,0 -S132/193/255 -V
    gmt colorbar -Dx2.0i/-0.4i+w4.5i/0.1i+h+e+jCM -Bxf1000a500+l"Relief of Taiwan (SRTM-DEM)" /
    -By+l"meter" -I -V --FONT_LABEL=12p --FONT_ANNOT_PRIMARY=6p
gmt end
# gmt plot case 3
# ======= Plot Geotiff directly ====================
gmt grdinfo tw_srtm30m.tif > tw_srtm30m.tif.info
cat tw_srtm30m.tif.info
gmt begin$prefix3 tif A+m0.5c
    gmt basemap -Jm121.0/1i -R$range -B1f0.5 -V
    gmt grd2cpt $in -Z -Cdem2 -V
    gmt grdimage $in -I+a130+ne0.8 -V
    gmt coast -Df -W0.5p,0 -S132/193/255 -V
    gmt colorbar -Dx2.0i/-0.4i+w4.5i/0.1i+h+e+jCM -S -Bxf1000a500+l"Relief of Taiwan (SRTM-DEM)" /
    -By+l"meter" -I -V --FONT_LABEL=12p --FONT_ANNOT_PRIMARY=6p
gmt end
# Delete unnecessary files
rm *.conf