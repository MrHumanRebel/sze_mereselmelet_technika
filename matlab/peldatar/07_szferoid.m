% SZFEROID/ELLIPSZOID – a bemenet három ÁTMÉRŐ (A,B,C) mm-ben és m g-ban!
% A feladat térfogatképlete féltengelyekkel V=(4/3)πabc,
% átmérőkkel ekvivalensen V=πABC/6.
clearvars;close all;clc;setup;
file='szferoid1.mat';if ~isfile(file),error('Másold ide: szferoid1.mat');end
S=load(file);X=[S.A(:),S.B(:),S.C(:),S.m(:)];
[Xf,~,removed]=clean_rows_sigma(X,3);
fprintf('Elvetett eredeti minták: %s\n',mat2str(removed'));
mu=mean(Xf,1);s=std(Xf,0,1);se=s/sqrt(size(Xf,1));
D1=mu(1);D2=mu(2);D3=mu(3);m=mu(4);
Vmm3=pi*D1*D2*D3/6;
rho_g_mm3=m/Vmm3;rhoSI=rho_g_mm3*1e6;
% J: [d/dA, d/dB,d/dC, d/dm] sorrendben.
JV=[pi*D2*D3/6,pi*D1*D3/6,pi*D1*D2/6,0];
JR=[-rho_g_mm3/D1,-rho_g_mm3/D2,-rho_g_mm3/D3,1/Vmm3];
C=cov(Xf)/size(Xf,1);
uV=sqrt(max(0,JV*C*JV'));
uRho=sqrt(max(0,JR*C*JR'));
for j=1:4,fprintf('Jellemző %d: %.5f, egyedi szórás %.5f, közép SEM %.5f\n',j,mu(j),s(j),se(j));end
fprintf('V = %.6g ± %.3g mm3\n',Vmm3,uV);
fprintf('rho = %.6g ± %.3g kg/m3\n',rhoSI,uRho*1e6);
figure('Name','Ellipszoid mérések');
for j=1:4,subplot(2,2,j);plot(X(:,j),'.');grid on;title(sprintf('oszlop %d',j));end
