% FORRÁSADATOK ELLENŐRZÉSE – a saját Moodle MAT fájlokat a Current Folderbe tedd.
% Nem talál ki helyettesítő adatot, ha forrás hiányzik: SKIP.
clearvars;close all;clc;setup;
if isfile('rad_bomlas.mat')
 S=load('rad_bomlas.mat');r=fitline_ols(S.t(:),log(S.A(:)));
 T=-log(2)/r.m;
 assert(abs(T-7099.6)<1);
 fprintf('[PASS] radioaktív tanári referencia T=%.2f s\n',T);
else, fprintf('[SKIP] rad_bomlas.mat hiányzik\n');end
if isfile('teglatest1.mat')
 S=load('teglatest1.mat');
 [X,~,removed]=clean_rows_sigma([S.a(:),S.b(:),S.c(:),S.m(:)],3);
 assert(size(X,2)==4 && all(isfinite(X(:))) && size(X,1)>=90);
 fprintf('[PASS] téglatest: %d jó minta, kizárt indexek=%s\n',size(X,1),mat2str(removed'));
else, fprintf('[SKIP] teglatest1.mat hiányzik\n');end
if isfile('korkup1.mat')
 S=load('korkup1.mat');X=[S.M(:),S.d(:)];
 assert(size(X,1)==100);
 means=mean(X,1);
 assert(all(means>0));
 fprintf('[PASS] kúpadatok: %d minta\n',size(X,1));
else, fprintf('[SKIP] korkup1.mat hiányzik\n');end
if isfile('barometer.mat')
 S=load('barometer.mat');mask=S.p(:)>0;
 assert(sum(~mask)==3);
 r=fitline_ols(double(S.h(mask)),log(S.p(mask)));
 p0=exp(r.b);
 assert(abs(p0-961.826)<.2);
 fprintf('[PASS] barometer: három p<=0 és p0≈%.2f (forrás-egység)\n',p0);
else, fprintf('[SKIP] barometer.mat hiányzik\n');end
if isfile('hang_jelek1.mat')
 S=load('hang_jelek1.mat');
 out=echo_delay_local(S.jel_1,S.jel_2,22000,1500,81);
 assert(abs(out.distance_m-1296)<15);
 fprintf('[PASS] szonár: d≈%.2f m\n',out.distance_m);
else, fprintf('[SKIP] hang_jelek1.mat hiányzik\n');end
if isfile('villanymotor.mat')
 S=load('villanymotor.mat');
 assert(isfield(S,'adatokmotor') && size(S.adatokmotor,2)==3);
 g=group_median_pairs(double(S.adatokmotor));
 fprintf('[PASS] motor: %d mérésből %d csoport\n',size(S.adatokmotor,1),size(g,1));
else, fprintf('[SKIP] villanymotor.mat hiányzik\n');end
fprintf('Valós Moodle adatainak tesztje véget ért – a SKIP nem PASS.\n');
