%vizsgapelda megoldasa

clear all
close all

load hang_jelek1.mat
%szemrevetelezem az adatokat
%plot(jel_1)
%plot(jel_2)

v_hang=1500;
Fs=22000;
delta_t=1/Fs;

%biztonsag kedveert detrendelem a jeleket
jel1_det=detrend(jel_1);
jel2_det=detrend(jel_2);
%meggondolando, hogy egy kis ablakmeretu simitast alkalmazak-e

%ha eszrevesszuk a szonar jelet, akkor alkalmazzunk egy jelhez kepest joval rovidebb ablaku simitast:
%j1=smooth(jel1_det,101);
%j2=smooth(jel2_det,101);
%[ccf,tau]=xcorr(j1,j2);

[ccf,tau]=xcorr(jel1_det,jel2_det);
plot(tau,ccf)
%mivel nem jol lathato ezert simitunk
ccf_sim=smooth(ccf,81);
plot(tau,ccf_sim)
%leolvasom az abrarol, hogy
esemeny=38010;
%ennyi eltolas mellett lesz

repules_ido=esemeny*delta_t;
%v=s/t
%s=v*t
tavolsag = v_hang*(repules_ido/2)
%bal oldali becsles (kb. felertek szelessegnel)
bal=38290;
%jobb oldali becsles (kb. felertek szelessegnel)
jobb=37530;
rep_ido_min=jobb*delta_t;
rep_ido_max=bal*delta_t;
tav_min=v_hang*(rep_ido_min/2)
tav_max=v_hang*(rep_ido_max/2)

%tengerfenek tavolsaga: (1296 +-10) m
