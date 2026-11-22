%help audioread vagy help wavread
clear all
close all

[hang, Fs] = audioread('guitar_A.wav'); %wav file beolvasasa
T = 1/Fs;
N = 41985; 
%N = length(hang) alternativ lehetoseg az N-re
t = (0:N-1)*T; %idotengely letrehozasa

%plot(t,hang) szemrevetelezes
Y = fft(hang);
P2 = abs(Y)/N;
P1 = P2(1:N/2+1);
P1(1:end-1) = 2*P1(1:end-1);

dF = Fs/N; %frekvencia felbontas	
f = dF*(0:(N/2)); %frekvencia tengely letrehozasa

figure(2)
plot(f,P1)
title('Single-sided Amplitude Spectrum of y(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
