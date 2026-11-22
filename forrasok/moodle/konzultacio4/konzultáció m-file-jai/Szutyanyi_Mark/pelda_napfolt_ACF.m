%az autokorrelacios fuggveny egy alkalmazasa valodi jeleken
clear all
close all

%adatok beolvasasa
load 'havi_napfolt.csv'; %az elso oszlop az ev, a masodik a honap, a negyedik a napfoltok szama adott honapban 

idosor = havi_napfolt(1813:end,4); %1813. adat 1900. januar, nekunk most csak a 4. oszlop szamit
idosor_detrend=detrend(idosor);
    %ha nagysagrendi becslest szeretnenk a napfolt-ciklus periodusara, akkor lehet egy durvabb
    %simitast alkalmazni
    % simitott_idosor=smooth(idosor_detrend,51);
    % plot(simitott_idosor)
plot(idosor) %havi napfoltok szama 1900.januarjatol napjainkig, a vizszintes tengely a honapok szama
figure(2) %uj ablak nyitasa
%autocorr(idosor,1450-1)

%bar kicsit mas a megjenites, ez is ugyanazt az eredmenyt adja:
[ccor,tau]=xcorr(idosor,idosor);
plot(tau,ccor)
