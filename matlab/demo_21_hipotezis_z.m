% SAJÁT tematika-variáns: kétoldali nagy-mintás z-próba ismert szórással.
% Nullhipotézis mu=mu0, X normál, sigmaKnown VALÓBAN ismert.
clearvars;close all;clc;
rng(21);n=100;mu0=10;sigmaKnown=2;
x=10.5+sigmaKnown*randn(n,1);
z=(mean(x)-mu0)/(sigmaKnown/sqrt(n));
p=erfc(abs(z)/sqrt(2));alpha=.05;
fprintf('Z=%.4f, kétoldali p=%.6f, alfa=%.2f; elutasítás: %d\n',z,p,alpha,p<alpha);
fprintf('Ismeretlen sigma és kis n esetén Student-t, nem ez a z-közelítés kell.\n');
