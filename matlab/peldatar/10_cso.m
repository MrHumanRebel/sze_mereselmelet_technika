% CSŐDARAB – 2000 méretmérés, 25 sűrűségmérés, analitikus érzékenységek.
% D,d,h [mm], rho [kg/m3]; képletek az oktatói cso_teh_nyom.pdf alapján.
clearvars;close all;clc;setup;
file='cso_adatok.mat';if ~isfile(file),error('Másold ide: cso_adatok.mat');end
S=load(file);
% A tanári levezetés 2000 méretnél 4σ-t, 25 rho-nál 3σ-t tárgyal.
[dim,~,removedDim]=clean_rows_sigma([S.D(:),S.d(:),S.h(:)],4);
[rhoc,~,removedRho]=clean_rows_sigma(S.rho(:),3);
fprintf('Kizárt dimenzióminta: %s; kizárt sűrűségminta: %s\n',mat2str(removedDim'),mat2str(removedRho'));
mu=mean(dim,1)/1000; D=mu(1);d=mu(2);h=mu(3);rho=mean(rhoc);
if D<=d || d<=0 || h<=0,error('Fizikailag lehetetlen csőgeometria.');end
mass=rho*pi*h*(D^2-d^2)/4;
Iz=rho*pi*h*(D^4-d^4)/32;
Ix=rho*pi*h*(D^4-d^4)/64+rho*pi*h^3*(D^2-d^2)/48;
% Input-sorrend: [D d h rho]. Mért dimenziók kovarianciáját megtartjuk.
CovIn=zeros(4);
CovIn(1:3,1:3)=cov(dim)/(size(dim,1)*1e6); % mm² -> m², és közép kovarianciája
CovIn(4,4)=var(rhoc,0)/numel(rhoc);
JM=[rho*pi*h*D/2, -rho*pi*h*d/2, rho*pi*(D^2-d^2)/4, pi*h*(D^2-d^2)/4];
JZ=[rho*pi*h*D^3/8,-rho*pi*h*d^3/8,rho*pi*(D^4-d^4)/32,pi*h*(D^4-d^4)/32];
JX=[rho*pi*h*D^3/16+rho*pi*h^3*D/24,...
   -rho*pi*h*d^3/16-rho*pi*h^3*d/24,...
   rho*pi*(D^4-d^4)/64+rho*pi*h^2*(D^2-d^2)/16,...
   pi*h*(D^4-d^4)/64+pi*h^3*(D^2-d^2)/48];
um=sqrt(max(0,JM*CovIn*JM'));
uIz=sqrt(max(0,JZ*CovIn*JZ'));
uIx=sqrt(max(0,JX*CovIn*JX'));
fprintf('Tömeg: %.6f ± %.6f kg\n',mass,um);
fprintf('Ix: %.7g ± %.3g kg m²\n',Ix,uIx);
fprintf('Iz: %.7g ± %.3g kg m²\n',Iz,uIz);
fprintf('Az oktatói PDF ellenőrzésül kb. m=0.94 kg; Ix=9.85e-4, Iz=4.01e-4 kg m² értéket ad.\n');
figure('Name','Cső méretek');subplot(2,2,1);histogram(dim(:,1));title('D mm');
subplot(2,2,2);histogram(dim(:,2));title('d mm');
subplot(2,2,3);histogram(dim(:,3));title('h mm');
subplot(2,2,4);histogram(rhoc);title('rho kg/m3');
