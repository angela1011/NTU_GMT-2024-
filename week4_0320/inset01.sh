gmt begin inset1 jpg 
gmt basemap -R0/40/20/60 -JM6.5i -Bafg -B+glightgreen
  gmt inset begin -DjTR+w2.5i+o0.2i -F+gpink+p0.5p -M0.25i
    gmt basemap -Rg -JA20/20/2i -Bafg
    gmt text -F+f18p+cTR+tINSET -Dj-0.15i -N
  gmt inset end
  gmt text -F+f18p+cBL+tMAP -Dj0.2i
gmt end