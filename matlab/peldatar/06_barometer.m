% BAROMÉTER – p(h)=p0*exp(-rho0*g*h/p0), átalakítás ln(p)=m*h+b.
% Tanári megjegyzés: az adatok önkényes egységek, az SI-eredményt NEM állítjuk!
clearvars;close all;clc;setup;
file='barometer.mat';if ~isfile(file),error('Másold ide: barometer.mat');end
S=load(file);h=S.h(:);p=S.p(:);
valid=isfinite(h)&isfinite(p)&p>0;
fprintf('Nem pozitív/nem véges nyomás miatt kizárt sorok: %s\n',mat2str(find(~valid)'));
h=h(valid);p=p(valid);
Y=log(p);r=fitline_ols(h,Y);
g=9.806;p0=exp(r.b);rho0=-r.m*p0/g;
% Közös regresszióból származó m,b korrelált; V=J*Cov*J'!
J=[-p0/g,rho0];
uRho=sqrt(max(0,J*r.cov*J'));
uP0=p0*r.ub;
fprintf('m=%.8g ± %.3g; b=%.8g ± %.3g; R2=%.4f\n',r.m,r.um,r.b,r.ub,r.R2);
fprintf('p0 = %.6g ± %.3g [adatbeli p-egység]\n',p0,uP0);
fprintf('rho0 = %.6g ± %.3g [modellből kapott egység, SI NEM igazolt]\n',rho0,uRho);
fprintf('A feladat eredeti kommentje szerint a h és p nem SI-ban adott. Egységátváltás nélkül ez nem kg/m3.\n');
figure('Name','Barométer');
subplot(2,1,1);plot(h,p,'o');hold on;plot(h,p0*exp(r.m*h),'-');
grid on;xlabel('Magasság [forrás-egység]');ylabel('Nyomás [forrás-egység]');
legend('Mért','Illesztett');
subplot(2,1,2);plot(h,Y,'.',h,r.yhat,'-');grid on;
xlabel('Magasság [forrás-egység]');ylabel('ln p');
