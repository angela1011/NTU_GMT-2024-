#!/usr/bin/env -S bash -e
# Stereographic Equal-Angle projection (-Js -JS)
# Polar Stereographic Map

gmt begin Lect01D
  gmt coast -R-30/30/60/72 -Js0/90/4.5i/60 -B10g -Dl -A250 -Groyalblue -Sseashell -V
gmt end
