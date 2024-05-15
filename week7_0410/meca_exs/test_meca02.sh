# https://docs.generic-mapping-tools.org/latest/supplements/seis/meca.html
# Using quick modern mode
# Normal-faulting CMT mechanism
# Sc: Focal mechanisms in Global CMT convention

gmt meca -R239/240/34/35.2 -Jm4c -Sc2c -pdf test << END
# lon lat depth str dip slip st dip slip mant exp plon plat
239.384 34.556 12. 180 18 -88 0 72 -90 5.5 0 0 0
END