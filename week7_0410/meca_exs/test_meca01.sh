# Example from https://docs.gmt-china.org/6.5/module/meca/
# Using quick modern mode
# Long Lat focal depth(km) strike dip rake Mag newX newY ID

gmt meca -JQ104/15c -R102.5/105.5/30.5/32.5 -Ba -Sa1c -png beachball01 << EOF
# Long. Lat. focal depth(km) strike dip rake Mag. newX newY ID
104.33 31.91 39.8 32 64 85 7 0 0 eventA
104.11 31.52 27.1 22 53 57 6 0 0 eventB
EOF