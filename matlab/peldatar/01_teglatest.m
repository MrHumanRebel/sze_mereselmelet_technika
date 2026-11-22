% TÉGLATEST – tanári feladat1; 100 mérés, a,b,c,m.
% Külön: egyedi gyártási szórás vs a becsült átlagok standard hibája.
clearvars;close all;clc;setup;
file='teglatest1.mat';
if ~isfile(file), error('Másold ide a gyakorlo_peldak/feladat1/teglatest1.mat fájlt!');end
S=load(file);X=[S.a(:),S.b(:),S.c(:),S.m(:)];
[Xf,keep,removed]=clean_rows_sigma(X,3);
names={'a','b','c','m'};
fprintf('Elvetett minták eredeti sorszámai: %s\n',mat2str(removed'));
mu=mean(Xf,1);sd=std(Xf,0,1);sem=sd/sqrt(size(Xf,1));
for j=1:4
  fprintf('%s: átlag=%.7g, egyedi szórás=%.4g, közép SEM=%.4g\n',names{j},mu(j),sd(j),sem(j));
end
a=mu(1);b=mu(2);c=mu(3);m=mu(4);
V=a*b*c;rho=m/V;
% J=(∂rho/∂a,∂rho/∂b,∂rho/∂c,∂rho/∂m).
J=[-rho/a,-rho/b,-rho/c,1/V];
% Összetartozó alkatrészek jellemzőinél kovarianciát is figyelembe vesszük.
CovIndividual=cov(Xf);
uRhoIndividual=sqrt(max(0,J*CovIndividual*J'));
uRhoMean=sqrt(max(0,J*(CovIndividual/size(Xf,1))*J'));
JV=[b*c,a*c,a*b,0];
uVmean=sqrt(max(0,JV*(CovIndividual/size(Xf,1))*JV'));
fprintf('V=%.6g ± %.3g (közép SEM alapú)\n',V,uVmean);
fprintf('rho=%.6g, egyedi szórás-becslés=%.3g, közép standard hibája=%.3g\n',rho,uRhoIndividual,uRhoMean);
fprintf('Az eredményegység függ a tanári adatfile-ban használt hosszegységtől és tömegegységtől.\n');
figure('Name','Téglatest – durvahiba-ellenőrzés');
for j=1:4
 subplot(2,2,j);plot(X(:,j),'.');hold on;plot(find(~keep),X(~keep,j),'ro');
 grid on;xlabel('Mintasorszám');ylabel(names{j});title(names{j});
end
