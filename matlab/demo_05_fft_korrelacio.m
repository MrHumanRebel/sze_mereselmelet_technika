% FFT + PSD + CSD + koherencia + impulzus késleltetése.
clearvars;close all;clc;setup;
rng(4);fs=1000;t=(0:1999)'/fs;
x=2*sin(2*pi*50*t)+.5*sin(2*pi*120*t)+.15*randn(size(t));
y=[zeros(20,1);x(1:end-20)]+.15*randn(size(t));
[f,A]=one_sided_fft(x-mean(x),fs);
r=spectra_welch_local(x,y,fs,250);
z=echo_delay_local(x,y,fs,340);
fprintf('Nyquist %.1f Hz; FFT df=%.3f Hz; késés %d minta / %.4f s\n',fs/2,fs/numel(x),z.lag_samples,z.delay_seconds);
figure('Name','FFT/koherencia');
subplot(3,1,1);plot(f,A);xlim([0 200]);grid on;ylabel('Amplitúdó');
subplot(3,1,2);plot(r.f,r.Pxx);xlim([0 200]);grid on;ylabel('PSD [j^2/Hz]');
subplot(3,1,3);plot(r.f,r.coherence);xlim([0 200]);ylim([0 1.05]);grid on;
xlabel('Frekvencia [Hz]');ylabel('Koherencia');
