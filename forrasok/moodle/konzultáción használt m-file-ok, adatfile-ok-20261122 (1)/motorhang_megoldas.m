clear all
close all

load motorhang.mat

T = 1/Fs;             % Sampling period     
N = length(original);
t = (0:N-1)*T;


Y = fft(original);
P2 = abs(Y)/N;
P1 = P2(1:N/2+1);
P1(1:end-1) = 2*P1(1:end-1);

dF = Fs/N; %frequency resolution
f = dF*(0:(N/2));

figure(2)
plot(f,P1)
title('Single-sided Amplitude Spectrum of y(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

USED = fft(used);
P2_u = abs(USED)/N;
P1_u = P2_u(1:N/2+1);
P1_u(1:end-1) = 2*P1_u(1:end-1);

figure(3)
plot(f,P1_u)
title('Single-sided Amplitude Spectrum of y(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

figure(4)
plot(f,P1_u-P1)
