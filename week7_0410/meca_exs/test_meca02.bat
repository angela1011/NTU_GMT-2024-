REM https://docs.generic-mapping-tools.org/latest/supplements/seis/meca.html
REM Using quick modern mode
REM Normal-faulting CMT mechanism
REM Sc: Focal mechanisms in Global CMT convention
REM lon lat depth str dip slip st dip slip mant exp plon plat

echo 239.384 34.556 12. 180 18 -88 0 72 -90 5.5 0 0 0 | gmt meca -R239/240/34/35.2 -Jm4c -Sc2c -jpg beachball02 -V
