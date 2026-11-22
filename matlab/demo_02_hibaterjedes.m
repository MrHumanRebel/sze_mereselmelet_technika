% Kúp: térfogat, tömeg, analitikus hibaterjedés.
clearvars;close all;clc;
d=0.020;ud=0.0002;      % m
h=0.050;uh=0.0005;      % m
rho=4432;               % kg/m3, pontosnak tételezve a példában
V=pi*d^2*h/12;
m=rho*V;
uV=sqrt((pi*d*h/6*ud)^2+(pi*d^2/12*uh)^2);
um=rho*uV;
fprintf('V = (%.8f +- %.8f) m3\n',V,uV);
fprintf('m = (%.5f +- %.5f) kg\n',m,um);
% Ha rho sem pontos: u_m^2 = (V*u_rho)^2 + (rho*uV)^2.
