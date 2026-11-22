clear all
close all


Fs = 1000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
N = 282;              % Length of signal
t = (0:N-1)*T;        % Time vector


%adjustable variables
A1 = 2; %amplitude of sin
A2 = 5; %amplitudo of cos

F1 = 50; %frequency of sin
F2 = 110; %frequency of cos

Z = 5; %zero-mean white noise with a variance of Z.



x = A1*sin(2*pi*F1*t)+ A2*cos(2*pi*F2*t); %signal
y = x + Z*randn(size(t)); %noisy signal

figure(1)
plot(t,x,'g','LineWidth',2)
hold on
plot(t,y,'r','LineWidth',2)
title('original signal and noisy signal')
hold off


Y = fft(y);
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

