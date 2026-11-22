% Tanári 4. konzultáció: havi_napfolt.csv, 4. oszlop.
% A tanári példa 1813. sortól indul (1900. január).
clearvars;close all;clc;setup;
file='havi_napfolt.csv';
if ~isfile(file)
 error('Másold ide a konzultacio4/.../Szutyanyi_Mark/havi_napfolt.csv fájlt!');
end
data=readmatrix(file);
if size(data,2)<4 || size(data,1)<1813,error('Nem a várt CSV-struktúra.');end
series=data(1813:end,4);series=series(isfinite(series));
maxLag=min(180,numel(series)-1);
[lags,acf]=acf_fft_local(series,maxLag,true);
% Lag=0 mindig a triviális csúcs; azt nem használjuk periódusnak.
accepted=lags>=60;
lagLong=lags(accepted);acfLong=acf(accepted);
[ii,vals]=local_peaks(acfLong,6,.1);
if isempty(ii)
 fprintf('Nincs megbízható lokális hosszúciklusú ACF-csúcs.\n');
else
 [~,j]=max(vals);periodMonths=lagLong(ii(j));
 fprintf('Becsült ciklus: %.1f hónap, azaz %.2f év (ACF, közelítés).\n',periodMonths,periodMonths/12);
end
figure('Name','Napfoltciklus');
subplot(2,1,1);plot(1900+(0:numel(series)-1)/12,series);
grid on;xlabel('Év');ylabel('Havi napfoltszám');
subplot(2,1,2);plot(lags/12,acf);grid on;
xlabel('Késés [év]');ylabel('Normált ACF');
