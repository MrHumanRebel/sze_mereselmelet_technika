% TENGERALATTJÁRÓ SZONÁR – eredeti tanári vizsgafeladat:
% hang_jelek1.mat, fs=22000 Hz, vízben hangsebesség 1500 m/s.
% Fontos: a nyers ccf abs-max a zaj miatt FÉLREVEZETŐ lehet.
% A tanári vizsgapelda.m 81-es simítást használ; így kb. 38010 minta lag.
clearvars;close all;clc;setup;
file='hang_jelek1.mat';if ~isfile(file),error('Másold ide: hang_jelek1.mat');end
S=load(file);fs=22000;v=1500;
r=echo_delay_local(S.jel_1(:),S.jel_2(:),fs,v,81);
fprintf('Simított CCF csúcs: lag=%d minta, távolság=%.3f m\n',r.lag_samples,r.distance_m);
fprintf('A tanári megoldás szerint kb. (1296 ± 10) m; ezt a korreláció ábráján is ellenőrizd!\n');
% A tanári 37530–38290 csúcshatár egy kb. 13 m fél-tartományt ad;
% nem általános standard szórás. Itt intervallumként szerepel, nem U-ként.
leftLag=37530;rightLag=38290;
lowDist=v*leftLag/(2*fs);highDist=v*rightLag/(2*fs);
fprintf('Tanári grafikus becslési tartomány: %.2f … %.2f m\n',lowDist,highDist);
figure('Name','Szonár korreláció');
plot(r.lags,r.smoothed);hold on;
plot(r.lag_samples,r.smoothed(r.peak_index),'ro');
xlabel('Késés [minta]');ylabel('81 pontosan simított CCF');
grid on;title(sprintf('Késés=%d minta, d=%.1f m',r.lag_samples,r.distance_m));
