% Alias: a Nyquist feletti frekvencia alacsonyabbként látszik.
clearvars;close all;clc;setup;
fs=1000;t=(0:999)'/fs;realF=700;
x=sin(2*pi*realF*t);[f,A]=one_sided_fft(x,fs);
[~,i]=max(A(2:end));i=i+1;
fprintf('Mintavételezés fs=%d Hz; valódi f=%d Hz; FFT látszó f=%.1f Hz\n',fs,realF,f(i));
fprintf('Nyquist=%.1f Hz. A 700 Hz 300 Hz-es aliasnak látszik.\n',fs/2);
assert(abs(f(i)-300)<1e-9);
figure;plot(f,A);grid on;xlabel('f [Hz]');ylabel('Amplitúdó');
title('Aliasing: 700 Hz -> 300 Hz (fs=1000 Hz)');
