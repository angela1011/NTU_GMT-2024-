# Illumination and intensities
# extract a subset of the global 30” DEM called SRTM30+:
gmt begin GMT_tut_15 -V
	gmt makecpt -Crainbow -T1000/5000 -S
	gmt grdimage @earth_relief_30s -R-108/-103/35/40 -JM6i -B -BWSnE
	gmt colorbar -DJTC -I0.4 -Bxa -By+lm
gmt end