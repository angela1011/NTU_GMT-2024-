REM Converting between different grdfile formats
REM Original batchfile was created by Huang Chung, Department of Geosciences, National Taiwan University
REM Edited by Bo-Han Tsao, Department of Geosciences, National Taiwan University, fot GMT6.0
REM id=cf, GMT netCDF format (32-bit float, deprecated)                 
REM id=nf, GMT netCDF format (32-bit float, COARDS, CF-1.5)                     

REM set variables
set grd=tw_relief_15s.nc
set prefix=Lect10a
set range=118.5/123.5/20/26.5
REM configure
gmt gmtset MAP_ORIGIN_X 1i MAP_ORIGIN_Y 1i
gmt gmtset PROJ_LENGTH_UNIT = inch
gmt gmtset FORMAT_GEO_MAP ddd:mm:ssF 

echo grdcut, extract subregion from a grid (earth_relief_15s.nc, remote downloading)
gmt grdcut @earth_relief_15s -R%range% -G%grd%
REM get info
gmt grdinfo %grd% > tw_relief_15s.nc.info
type tw_relief_15s.nc.info

rem ======= grdconvert NetCDF format: nf ==================== 
gmt grdconvert %grd% tw_relief_15s_ni.nc=ni -V
gmt grdinfo tw_relief_15s_ni.nc > tw_relief_15s_ni.nc.info
type tw_relief_15s.nc_ni.nc.info

echo sf Golden Software Surfer format 6 (32-bit float)
gmt grdconvert %grd% tw_relief_15s_sf.nc=sf -V
gmt grdinfo tw_relief_15s_sf.nc > tw_relief_15s_sf.nc.info 
type tw_relief_15s_sf.grd.info 
REM  ======== gmt plot =============
gmt begin %prefix% tif A+m0.5c
    rem ======= Plot basemap ========================
    gmt grd2cpt tw_relief_15s_ni.nc -Csealand -L-8000/4000 -T-8000/4000/500 -V
    gmt grdimage tw_relief_15s_ni.nc -Jm121/1.0 -R%range% -C -I+a310+ne1.0 -V
    gmt coast -Df -Ba1f0.5 -W1 -V
    gmt colorbar -C -Dx2.5/-0.5+w6/0.15+h+e+jTC -S -Bx1000+l"Relief color-coded with Sealand" -By+lmeter -V    
gmt end
pause

