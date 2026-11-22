% Monte Carlo vs analitikus hibaterjedés – gömb átmérőből.
clearvars;close all;clc;
rng(123);d=10;ud=.1;N=100000; % mm
draws=d+ud*randn(N,1);
V=pi*d^3/6;uV=(pi*d^2/2)*ud;
Vsim=pi*draws.^3/6;
fprintf('Analitikus: V=%.4f ± %.4f mm3\n',V,uV);
fprintf('Monte Carlo: várható térfogat=%.4f, szórás=%.4f mm3\n',mean(Vsim),std(Vsim));
figure;histogram(Vsim,80);grid on;xlabel('V [mm3]');ylabel('Gyakoriság');
title('Hibaterjedés numerikus kontroll');
