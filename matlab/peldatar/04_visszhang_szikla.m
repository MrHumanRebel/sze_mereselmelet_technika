% SZIKLAFAL – hang_jelek.mat, 1kHz, 340 m/s, oda-vissza út.
clearvars;close all;clc;setup;
file='hang_jelek.mat';if ~isfile(file),error('Másold ide: feladat4/hang_jelek.mat');end
S=load(file);a=S.jel_1(:);b=S.jel_2(:);
fs=1000;v=340; % a feladat szövegében megadva
out=echo_delay_local(a,b,fs,v,41);
fprintf('A korreláció smoothed csúcsa: lag=%d minta; |dt|=%.5f s; d=%.3f m\n',...
 out.lag_samples,out.delay_seconds,out.distance_m);
% Felbontás alapú, konzervatív lokalizálási becslés (nem teljes metrológiai U):
uLagSamples=ceil(41/2);deltaDistance=v*uLagSamples/(2*fs);
fprintf('A választott 41-mintás simítás félszélességéből vett durva d-tartomány: ±%.2f m.\n',deltaDistance);
fprintf('Ez nem rigorózus standard bizonytalanság; finomabb becsléshez csúcsszélesség, jel/zaj és sebesség-bizonytalanság kell.\n');
lagSec=out.lags/fs;
figure('Name','Sziklafal');
subplot(2,1,1);plot((0:numel(a)-1)/fs,a);
xlabel('Idő [s]');ylabel('Küldött jel');grid on;
subplot(2,1,2);plot(lagSec,out.smoothed);hold on;
plot(out.lag_samples/fs,out.smoothed(out.peak_index),'ro');grid on;
xlabel('Késés [s]');ylabel('Simított keresztkorreláció');
