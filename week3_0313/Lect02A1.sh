prefix=Lect02A
grd=/c/gridfiles/tw_topo500m.nc
int=tw_topo500m.nc.int
……
echo gridinfo, extract information from netCDF grid file 
gmt grdinfo ${grd} > tw_topo500m.nc.info
gmt begin ${prefix} ps,jpg A+m0.5c
gmt basemap -Jm121/23/1i -R118.5/123.5/20/26.5 -Ba2f1 -U/-0.5/-1.7/"Geodesy and Remote Sensing Lab, NTU" -V
gmt grdgradient ${grd} -A10/100 -G ${int} -Ne1 -fg -V
gmt grdimage ${grd} -Ctopo_sealand.cpt -I ${int} 
gmt coast -B -Df -W0.8p,0/0/0 -V
gmt end
rm ${int} 

