% Konfidenciaintervallum – 95%, normal-közelítés nagy mintára.
% Ha exact Student-t kell: tinv a Statistics Toolboxból (nem alap-MATLAB).
clearvars;close all;clc;
rng(22);x=10+2*randn(100,1);
s=measurement_stats(x);
z=1.95996398454005;
low=s.mean-z*s.sem;high=s.mean+z*s.sem;
fprintf('Mintaátlag %.4f, szórás %.4f, SEM %.4f\n',s.mean,s.std,s.sem);
fprintf('Nagy-mintás normál közelítésű 95%% CI: [%.4f, %.4f]\n',low,high);
fprintf('Kis mintában, ismeretlen sigma esetén Student-t kvantilis szükséges.\n');
