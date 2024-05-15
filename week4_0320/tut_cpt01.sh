# different ways of presenting the color bar:
# correct the errors for the label of color scale +l

gmt begin tut_cpt01 jpg
	gmt makecpt -H -Crainbow -T-20/60/10 > disc.cpt
	gmt makecpt -H -Crainbow -T-20/60 > cont.cpt
	gmt makecpt -H -Crainbow -T-20/60/10 -Iz > disc_Iz.cpt
	gmt makecpt -H -Crainbow -T-20/60/10 -Ic > disc_Ic.cpt
	gmt makecpt -H -Crainbow -T-20/60/10 -Icz > disc_Icz.cpt
	gmt basemap -R0/6/0/9 -Jx1i -B0 -Xr 
	gmt colorbar -Dx1i/1i+w4i/0.3i+h -Cdisc.cpt -Ba -B+ldiscrete 
	gmt colorbar -Dx1i/2i+w4i/0.3i+h -Ccont.cpt -Ba -B+lcontinuous 
	gmt colorbar -Dx1i/3i+w4i/0.3i+h -Cdisc.cpt -Ba -B+ldiscrete -I0.5 
	gmt colorbar -Dx1i/4i+w4i/0.3i+h -Ccont.cpt -Ba -B+lcontinuous -I0.5 
	gmt colorbar -Dx1i/5i+w4i/0.3i+h -Cdisc_Iz.cpt -Ba -B+lIz
	gmt colorbar -Dx1i/6i+w4i/0.3i+h -Cdisc_Ic.cpt -Ba -B+lIc
	gmt colorbar -Dx1i/7i+w4i/0.3i+h -Cdisc_Icz.cpt -Ba -B+lIcz
gmt end