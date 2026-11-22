% KÖRKÚP – mm-ben mért M magasság, d átmérő, ρ=4432 kg/m3.
clearvars;close all;clc;setup;
file='korkup1.mat';
if ~isfile(file),error('Másold ide: gyakorlo_peldak/feladat2/korkup1.mat');end
S=load(file);X=[S.M(:),S.d(:)];
[Xf,~,removed]=clean_rows_sigma(X,3);
fprintf('Indokoltan kiszűrt minták: %s\n',mat2str(removed'));
mu=mean(Xf,1);s=std(Xf,0,1);sem=s/sqrt(size(Xf,1));
h=mu(1)/1000;d=mu(2)/1000;rho=4432;
V=pi*d^2*h/12;
mass=rho*V;
% Képlettel, kovarianciát kezelve: m=ρ*pi*d²*h/12.
Jmm=rho*pi/12*[d^2/1000,2*d*h/1000]; % derivált [M_mm,d_mm] szerint
CovMean=cov(Xf)/size(Xf,1);
uMassMean=sqrt(max(0,Jmm*CovMean*Jmm'));
uMassIndividual=sqrt(max(0,Jmm*cov(Xf)*Jmm'));
fprintf('h=%.6f ± %.6f mm (átlag ± SEM)\n',mu(1),sem(1));
fprintf('d=%.6f ± %.6f mm (átlag ± SEM)\n',mu(2),sem(2));
fprintf('V=%.8g m3\n',V);
fprintf('tömeg=%.8g ± %.3g kg (becsült átlag); egyedi szórás: %.3g kg\n',mass,uMassMean,uMassIndividual);
figure;plot(X(:,1),'.');hold on;plot(X(:,2),'.');grid on;
xlabel('Mérés indexe');ylabel('mm');legend('M magasság','d átmérő');
