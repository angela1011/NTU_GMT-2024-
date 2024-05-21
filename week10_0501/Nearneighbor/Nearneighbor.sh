gmt begin map jpg
  gmt nearneighbor @ship_15.txt -R245/255/20/30 -I5m -Ggrid.nc -S15m
  gmt grdimage grid.nc -B
gmt end