#!/bin/bash

gmt begin GMT_tut_1 png
 gmt basemap -R10/70/-3/8 -JX4i/3i -Bxa10 -Bya5 -BWSen+gtomato+t"First plot"
gmt end