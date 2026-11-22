% Idealizált ADC kvantálási lépés és hibája.
clearvars;close all;clc;
bits=8;VFS=5;delta=VFS/2^bits;fs=1000;
t=(0:999)'/fs;
voltage=2.5+1*sin(2*pi*5*t);
codes=round(voltage/delta);
q=codes*delta;
errorQuant=q-voltage;
fprintf('%d bites %.1f V tartomány: Delta=%.6f V, elméleti uniform u=%.6f V\n',bits,VFS,delta,delta/sqrt(12));
fprintf('Numerikus kvantálási eltérések szórása %.6f V\n',std(errorQuant));
figure;plot(t(1:150),voltage(1:150),t(1:150),q(1:150),'.-');
grid on;legend('Analóg jel','Kvantált');xlabel('t [s]');ylabel('feszültség [V]');
