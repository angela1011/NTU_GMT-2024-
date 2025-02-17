#!/usr/bin/env bash
#               GMT EXAMPLE 44
#
# Purpose:      Illustrate use of map insets
# GMT modules:  coast, basemap, mapproject
#
gmt begin mid png
	gmt subplot begin 2x1 -Fs15c/10c -B -BWSne 
		gmt coast -R10W/5E/35N/44N -JM15c -EES+gbisque -Gbrown -Wfaint -N1/1p -Sazure1 -Dh -BWSne+t'R12224203'  -Ia/1.5p,lightblue  --FORMAT_GEO_MAP=dddF -c0
		gmt inset begin -DjTR+w5c/2.35c+o0.4c/0.25c -F+gwhite+p1p+c0.1c+s
			gmt coast -R15W/35E/30N/48N -JM? -Da -Gbrown -B0 -EES+gbisque --MAP_FRAME_TYPE=plain
		gmt inset end
		
		gmt coast -R110E/170E/44S/9S -JM15c -Wfaint -N2/1p -EAU+gbisque -Gbrown -Sazure1 -Da -U --FORMAT_GEO_MAP=dddF -c1
		echo 151.13 -33.52 | gmt plot -Ss0.5 -W0.01 -Gchocolate
		gmt text -F+f12p,0.8,black -W0.1 -Gwhite  << EOF
		151.13 -35.52 Sydney Opera House
EOF
		gmt inset begin -DjTR+w3.8c+o0.4c/0.25c -F+gwhite+p1p+c0.1c+s
			gmt coast -Rg -JG120/30S/? -Da -Gbrown -A5000 -Bg -Wfaint -EAU+gbisque
		gmt inset end
	gmt subplot end

gmt end
