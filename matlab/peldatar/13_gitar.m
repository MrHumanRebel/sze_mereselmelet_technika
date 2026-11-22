% GITÁRHANG – a 5. konzultációs guitar_A.wav helyes FFT-normalizálása.
clearvars;close all;clc;setup;
file='guitar_A.wav';if ~isfile(file),error('Másold ide: guitar_A.wav');end
[y,fs]=audioread(file);
if size(y,2)>1,y=mean(y,2);end
[f,A]=one_sided_fft(y-mean(y),fs);
[~,idx]=max(A(2:end));idx=idx+1;
fprintf('A legnagyobb nem-DC bin: f=%.2f Hz, amplitúdó=%.4f\n',f(idx),A(idx));
figure;plot(f,A);xlim([0 min(3000,fs/2)]);grid on;
xlabel('Frekvencia [Hz]');ylabel('Amplitúdó');
title('Gitár – egyoldali FFT');
