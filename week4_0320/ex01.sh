#!/bin/bash

gmt begin ex01 png
gmt set MAP_GRID_CROSS_SIZE_PRIMARY 0 FONT_ANNOT_PRIMARY 10p
gmt subplot begin 2x1 -A -M0.25i -Blrtb -Bafg -T"R12224203 Low Order Geoid" -Fs6.5i/0 -Rg -JH6.5i
	gmt coast -JH16.5c -Glightbrown -Slightblue -c0,0
	gmt grdcontour @osu91a1f_16.nc -C10 -A10000 -Gd4i -L-8000/50 -Wcthinnest,- -Wathin,- -T+l
	gmt grdcontour @osu91a1f_16.nc -C10 -A10000 -Gd4i -L50/500 -T+l

	gmt coast -JH0/16.5 -Glightbrown -Slightblue -c1,0
	gmt grdcontour @osu91a1f_16.nc -C15 -A10000 -Gd4i -L-5000/50 -Wcthinnest,- -Wathin,- -T+a0.1i/0.02i
	gmt grdcontour @osu91a1f_16.nc -C15 -A10000 -Gd4i -L50/100 -T+d0.1i/0.02i

# -JH?, JH0? -A50+f7p, -LP, Ln and -T0.1i/0.02i

gmt subplot end
gmt end
