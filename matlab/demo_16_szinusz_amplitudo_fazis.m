% SAJÁT gyakorló: frekvencia ismert, amplitúdó/fázis becslése OLS-szel.
clearvars;close all;clc;setup;
rng(16);fs=1000;t=(0:1999)'/fs;f=37.5;
trueAmp=2.2;truePhase=.45;trueOffset=.7;
y=trueOffset+trueAmp*sin(2*pi*f*t+truePhase)+.08*randn(size(t));
r=fit_sine_fixed_frequency(t,y,f);
fprintf('A=%.4f ± %.4f (igazi: %.2f)\n',r.amplitude,r.uAmplitude,trueAmp);
fprintf('fázis=%.4f ± %.4f rad (igazi: %.2f)\n',r.phase_rad,r.uPhase_rad,truePhase);
fprintf('offset=%.4f ± %.4f\n',r.offset,r.uOffset);
figure;plot(t(1:300),y(1:300),'.',t(1:300),r.fit(1:300),'-');
grid on;legend('Zajos adat','LS szinusz');
xlabel('t [s]');ylabel('Jel [egység]');
