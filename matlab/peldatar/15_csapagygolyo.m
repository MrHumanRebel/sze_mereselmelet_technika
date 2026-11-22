% Csapágygolyó: forrás a Moodle feladatok.pdf, de a MAT nem volt csatolva.
% A bemenet átmérő-vektor. Az eredmény egysége a bemenettől függ.
clearvars;close all;clc;setup;
filename='csapagygolyo_atmero.mat';
if ~isfile(filename)
 error('Hiányzó tanári MAT. Próbáld: run(''demo_13_csapagygolyo_szintetikus.m'')');
end
[d,field]=mat_vector_auto(filename);
[good,keep,removed]=clean_rows_sigma(d,3);
if any(good<=0),error('Az átmérőnek pozitívnak kell lennie.');end
s=measurement_stats(good);
V=pi*s.mean^3/6;
uVsingle=pi*s.mean^2*s.std/2;
uVmean=pi*s.mean^2*s.sem/2;
fprintf('Forrásváltozó: %s, n=%d; elvetett sorok=%s\n',field,s.n,mat2str(removed'));
fprintf('d=%.5f, egyedi s=%.5f, közép SEM=%.5f [hossz-egység]\n',s.mean,s.std,s.sem);
fprintf('V=%.5f, egyedi uV≈%.5f, közép-becslés uV≈%.5f [hossz-egység]^3\n',V,uVsingle,uVmean);
figure;plot(d,'.');hold on;plot(find(~keep),d(~keep),'ro');
grid on;xlabel('Mérés');ylabel('Átmérő [forrás-egység]');
