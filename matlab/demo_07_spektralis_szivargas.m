% Nem egész periódus, spektrális szivárgás és Hann-ablak.
clearvars;close all;clc;setup;
fs=1000;N=1000;t=(0:N-1)'/fs;freq=51.4;amp=2;
x=amp*sin(2*pi*freq*t);
[f,Arect]=one_sided_fft(x,fs);
w=.5-.5*cos(2*pi*(0:N-1)'/(N-1));
[~,Aw]=one_sided_fft(x.*w,fs);
Aw=Aw/mean(w); % koherens amplitúdó-nyereség korrekciója
figure('Name','Szivárgás');plot(f,Arect,'b-',f,Aw,'r-');
xlim([30 80]);grid on;xlabel('Frekvencia [Hz]');ylabel('Amplitúdó');
legend('Téglalapablak','Hann, amplitúdó korrigálva');
fprintf('Valódi frekvencia %.2f Hz, FFT df=%.2f Hz. A nulla-kitöltés nem javítja a valódi feloldást.\n',freq,fs/N);
