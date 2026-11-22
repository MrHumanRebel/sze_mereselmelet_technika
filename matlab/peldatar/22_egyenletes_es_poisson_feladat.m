% SAJÁT elméletből levezetett papíros feladat + MATLAB ellenőrzés.
clearvars;close all;clc;
% A: mérőfelbontás: q=0.1 mm. Lekerekítés hiba [-q/2,q/2].
q=.1;ua=q/sqrt(12);
fprintf('Uniform kvantálás q=%.3f mm -> standard u=%.6f mm\n',q,ua);
% B: Poisson: λ=4 esemény/perc, pontosan 2 esemény valószínűsége.
lambda=4;k=2;
P=exp(-lambda)*lambda^k/factorial(k);
assert(abs(P-.1465251111)<1e-8);
fprintf('Poisson(4): P(X=2)=%.7f, E=4, sigma=2\n',P);
% C: normál: kétoldali 2 sigma tartomány kb 95.45%.
withinTwo=erf(2/sqrt(2));
fprintf('P(|Z|<=2)=%.6f\n',withinTwo);
