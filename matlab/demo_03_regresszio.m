% Egyszerű lineáris regresszió és paraméterek hibája.
clearvars;close all;clc;setup;
rng(2);x=(0:0.5:20)';
y=2.5*x+3+0.8*randn(size(x));
r=fitline_ols(x,y);
fprintf('m = %.4f +- %.4f; b = %.4f +- %.4f; R2=%.4f\n',r.m,r.um,r.b,r.ub,r.R2);
figure('Name','Regresszió');subplot(2,1,1);
plot(x,y,'.',x,r.yhat,'-');grid on;legend('Mérés','Illesztés');xlabel('x');ylabel('y');
subplot(2,1,2);plot(x,r.residual,'.-');yline(0);grid on;
xlabel('x');ylabel('Reziduum');
