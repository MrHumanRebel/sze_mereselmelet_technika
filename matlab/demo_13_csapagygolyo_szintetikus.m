% Saját, NEM eredeti Moodle-adatokkal dolgozó csapágygolyó-minta.
clearvars;close all;clc;setup;
rng(1313);d=10+0.04*randn(100,1);d(17)=12.7; % elgépelési példa
[good,keep,removed]=clean_rows_sigma(d,3);
s=measurement_stats(good);V=pi*s.mean^3/6;
uIndividual=pi*s.mean^2*s.std/2;
uMean=pi*s.mean^2*s.sem/2;
fprintf('SZINTETIKUS: kizártak=%s; d=%.4f ± %.4f mm (egyedi s)\n',mat2str(removed'),s.mean,s.std);
fprintf('V=%.4f mm3; egyedi u=%.4f mm3; közép-SEM okozta u=%.4f mm3\n',V,uIndividual,uMean);
figure;plot(d,'.');hold on;plot(find(~keep),d(~keep),'ro');
xlabel('Mérés');ylabel('Átmérő [mm]');grid on;
