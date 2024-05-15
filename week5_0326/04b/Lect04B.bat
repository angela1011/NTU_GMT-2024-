REM Original batch file was created by teaching assistan Chiu Chun-Ying (邱俊穎) on 7 August 2007 for training course 
REM Remote Sensing and Geodetic Lab, Department of Geosciences, NTU.


set prefix=Lect04B
set grd1=GEBCO_2023_sub_ice_topo.nc
set grd2=cut.nc
set cpt=sealand_mk.cpt
set range=110/140/35/50
set start=118/48
set end=129/41

gmt gmtset FORMAT_GEO_MAP ddd:mm:ssF 
gmt grdcut %grd1% -G%grd2% -R%range% -V
gmt grdinfo %grd1% > GEBCO_2023.nc.info
type GEBCO_2023.nc.info

gmt begin %prefix% jpg A+m0.5c
gmt subplot begin 2x1 -Fs15c/10c -A -M1c
gmt subplot set 0 -A(a)
gmt makecpt -Csealand -T-5000/3000
gmt grdimage %grd2% -JM125/42? -R%range% -Ba5f2.5 -I+d -V
gmt coast -Dh -N1/1p,white -W1 -A500 -V
echo 118 48 > L_index.gmt
echo 129 41 >> L_index.gmt
gmt plot L_index.gmt -W2.5p,red -V
gmt colorbar -Dx0.0c/-1.5c+w15c/0.25c+h+e -I -Bx2000 -By+lm -V
gmt subplot set 1 -A(b)
gmt project -C%start% -E%end% -G1 -Q > track.xyp
gmt grdtrack track.xyp -G%grd2% > track.xypz
gawk "{ print $3,$4 }" track.xypz > track_profile.txt
gmt info track_profile.txt -I5 > minmax.out
type minmax.out
gmt plot -R0/1170/0/2200 track_profile.txt -JX? -Bxa500f250+l"Distance (km)" -Bya400f200+l"H (m)" -BSWne -W2p,red -V
gmt subplot end
gmt end

del gmt.conf L_index.gmt
pause





