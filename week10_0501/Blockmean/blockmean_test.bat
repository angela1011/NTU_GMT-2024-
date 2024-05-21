REM To find 5 by 5 minute block mean values from the ASCII data in ship_15.txt
gmt blockmean @ship_15.txt -R245/255/20/30 -I5m > ship_5x5.txt
REM To determine how many values were found in each 5x5 minute bin
gmt blockmean @ship_15.txt -R245/255/20/30 -I5m -Sn -E > ship_5x5_extend.txt
REM To determine the mean and standard deviation per 10 minute bin
REM and save these to two separate grids called field_z.nc and field_s.nc
gmt blockmean @ship_15.txt -I10m -R-115/-105/20/30 -E -Gfield_%%s.nc -Az,s
gmt grdinfo field_s.nc > field_s.nc.info
type field_s.nc.info
gmt grdinfo field_s.nc > field_z.nc.info
type field_z.nc.info
pause