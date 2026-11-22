% SAJÁT vizsgavariáns: eltérő mérési bizonytalanságú pontok.
% Az illesztés x etalon és y műszerjel között y=m*x+b.
clearvars;close all;clc;setup;
rng(15);x=(0:10)';sigma=.05+.03*x;
y=1.15*x+.4+sigma.*randn(size(x));
ols=fitline_ols(x,y);
wls=weighted_fit_line(x,y,sigma);
fprintf('OLS: m=%.5f±%.5f, b=%.5f±%.5f\n',ols.m,ols.um,ols.b,ols.ub);
fprintf('WLS: m=%.5f±%.5f, b=%.5f±%.5f, chi²_red=%.3f\n',...
 wls.m,wls.um,wls.b,wls.ub,wls.reducedChi2);
fprintf('Ha a sigma csak relatív súly, a fenti WLS paraméterhibák átskálázást igényelhetnek.\n');
figure;errorbar(x,y,sigma,'o');hold on;plot(x,wls.yhat,'r-',x,ols.yhat,'k--');
grid on;xlabel('Etalon x');ylabel('Műszer y');
legend('Mért ± abs. sigma','WLS','OLS');
