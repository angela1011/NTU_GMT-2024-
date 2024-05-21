REM SRTM-derived DEM
REM Original batch file was made by Tseng Chia-Han following the batch file created by Chiang Jei-Jhong, Institute of Oceanography, NTU
REM Batch file modified by Jyr-Ching Hu, Department of Geosciences, NTU 
REM Edited by Bo-Han Tsao, Department of Gepsciences, NTU for GMT6
REM set variables
set prefix=Lect10B
REM configure
gmt set PROJ_LENGTH_UNIT = inch
echo xyz2grd ....
gmt xyz2grd N37E020.hgt -Gg001.grd -I3s -R20/21/37/38 -di-32768 -ZTLhw
gmt xyz2grd N37E021.hgt -Gg002.grd -I3s -R21/22/37/38 -di-32768 -ZTLhw
gmt xyz2grd N37E022.hgt -Gg003.grd -I3s -R22/23/37/38 -di-32768 -ZTLhw
gmt xyz2grd N37E023.hgt -Gg004.grd -I3s -R23/24/37/38 -di-32768 -ZTLhw
gmt xyz2grd N37E024.hgt -Gg005.grd -I3s -R24/25/37/38 -di-32768 -ZTLhw
gmt xyz2grd N37E025.hgt -Gg006.grd -I3s -R25/26/37/38 -di-32768 -ZTLhw
gmt xyz2grd N38E020.hgt -Gg007.grd -I3s -R20/21/38/39 -di-32768 -ZTLhw
gmt xyz2grd N38E021.hgt -Gg008.grd -I3s -R21/22/38/39 -di-32768 -ZTLhw
gmt xyz2grd N38E022.hgt -Gg009.grd -I3s -R22/23/38/39 -di-32768 -ZTLhw
gmt xyz2grd N38E023.hgt -Gg010.grd -I3s -R23/24/38/39 -di-32768 -ZTLhw
gmt xyz2grd N38E024.hgt -Gg011.grd -I3s -R24/25/38/39 -di-32768 -ZTLhw
gmt xyz2grd N38E025.hgt -Gg012.grd -I3s -R25/26/38/39 -di-32768 -ZTLhw
echo grdpaste ...
gmt grdpaste g001.grd g002.grd -Ga1.grd
gmt grdpaste a1.grd g003.grd -Ga1.grd
gmt grdpaste a1.grd g004.grd -Ga1.grd
gmt grdpaste a1.grd g005.grd -Ga1.grd
gmt grdpaste a1.grd g006.grd -Ga1.grd
gmt grdpaste g007.grd g008.grd -Ga2.grd
gmt grdpaste a2.grd g009.grd -Ga2.grd
gmt grdpaste a2.grd g010.grd -Ga2.grd
gmt grdpaste a2.grd g011.grd -Ga2.grd
gmt grdpaste a2.grd g012.grd -Ga2.grd
gmt grdpaste a1.grd a2.grd -Ga3.grd

gmt grdinfo a3.grd > Greece_SRTM90mDEM.info
type Greece_SRTM90mDEM.info
REM gmt plot
gmt begin %prefix% tif A+m0.5c
    gmt basemap -Jm23.0/1i -R20/26/37/39 -Bxa2f1 -Bya1f0.5 -BWEnS+t" 90 m SRTM3 DEM" -V
    gmt grd2cpt a3.grd -L0/2500 -T0/2500/200 -Cc3t3.cpt
    gmt grdimage a3.grd -C -I+a10+ne0.8 -V
    gmt coast -Df -W1 -Slightcyan -V
    gmt colorbar -Dx7.5c/-1.2c+w10c/0.3c+h+e+jCM -Bxf100a500+l"Elevation of southern Greece" -By+lmeter -I -V
gmt end
REM Delete unnecessary files
del a*.grd g*.grd
del *.conf 
pause