% SAJÁT kiegészítő a 2026/27 tematikából: normál likelihood + normál prior.
% Adatok x_i~N(mu,sigmaKnown^2), prior mu~N(mu0,tau0^2).
clearvars;close all;clc;
rng(20);actualMu=10;knownSigma=2;n=30;
x=actualMu+knownSigma*randn(n,1);
muML=mean(x);mu0=8;tau0=3;
precision=1/tau0^2+n/knownSigma^2;
postVar=1/precision;
postMean=(mu0/tau0^2+n*muML/knownSigma^2)/precision;
fprintf('MLE mu=%.4f, prior mu0=%.2f, Bayes posterior mu=%.4f\n',muML,mu0,postMean);
fprintf('Posterior std=%.4f; ez a modell-feltételekhez tartozik.\n',sqrt(postVar));
