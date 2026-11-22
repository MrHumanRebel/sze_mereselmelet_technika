% SAJÁT tematikai variáns – kalibráció ismert etalon és 2 eltérő műszer.
clearvars;close all;clc;setup;
rng(2121);reference=(0:12)';sigA=.04*ones(size(reference));
sigB=.1+.02*reference;
a=1.02*reference+.2+sigA.*randn(size(reference));
b=.98*reference-.3+sigB.*randn(size(reference));
rA=weighted_fit_line(reference,a,sigA);
rB=weighted_fit_line(reference,b,sigB);
fprintf('A: meredekség %.4f ± %.4f, offset %.4f ± %.4f\n',rA.m,rA.um,rA.b,rA.ub);
fprintf('B: meredekség %.4f ± %.4f, offset %.4f ± %.4f\n',rB.m,rB.um,rB.b,rB.ub);
% Ellenőrző érték: a műszer 7.5 egységet mutat; vissza az etalon-skálára.
reading=7.5;
xA=(reading-rA.b)/rA.m;
% Paraméterkovariancia: J=[-(y-b)/m²,-1/m] m,b sorrendben.
J=[-xA/rA.m,-1/rA.m];
uCal=uncertainty_linear(J,rA.cov);
fprintf('A kalibrált bemenet %.4f ± %.4f [etalon-egység], csak paraméterhibából\n',xA,uCal);
figure;errorbar(reference,a,sigA,'o');hold on;errorbar(reference,b,sigB,'s');
plot(reference,rA.yhat,'-',reference,rB.yhat,'--');grid on;
xlabel('Etalon');ylabel('Műszerjel');legend('A','B','A illesztés','B illesztés');
