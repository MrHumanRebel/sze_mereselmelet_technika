% RADIOAKTÍV BOMLÁS – ln A = b + m*t; T=-ln(2)/m.
clearvars;close all;clc;setup;
file='rad_bomlas.mat';if ~isfile(file),error('Másold ide: rad_bomlas.mat');end
S=load(file);t=S.t(:);A=S.A(:);
ok=isfinite(t)&isfinite(A)&A>0;
fprintf('Kizárt nem pozitív/nem véges adatok: %d\n',sum(~ok));
t=t(ok);A=A(ok);
r=fitline_ols(t,log(A));
if r.m>=0,warning('A meredekség nem negatív; ellenőrizd az adatokat és modellt!');end
T=-log(2)/r.m;uT=abs(log(2)/r.m^2)*r.um;
A0=exp(r.b);uA0=A0*r.ub;
fprintf('m=%.8g ± %.4g [1/s], b=%.5f ± %.5f\n',r.m,r.um,r.b,r.ub);
fprintf('T felezési idő: %.2f ± %.2f s\n',T,uT);
fprintf('A0 aktivitás: %.1f ± %.1f Bq (ha a forrás Bq)\n',A0,uA0);
fprintf('Az oktatói PDF ellenőrzési értéke: T ≈ 7099.6 s, A0 ≈ 70801 Bq.\n');
figure('Name','Radioaktív bomlás');
subplot(2,1,1);plot(t,A,'.',t,A0*exp(r.m*t),'-');grid on;
xlabel('t [s]');ylabel('A [Bq]');legend('Mérés','Illesztés');
subplot(2,1,2);plot(t,log(A),'.',t,r.yhat,'-');grid on;
xlabel('t [s]');ylabel('ln A');
