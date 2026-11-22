% BABA1 – hivatalos 2026-os oktatói mintamegoldás adatkiválasztásával.
% Más adatfájl esetén a megadott sorokat/szegmenseket újra kell ellenőrizni.
clearvars;close all;clc;setup;
file='baba1.mat';if ~isfile(file),error('Másold ide: baba1.mat');end
S=load(file);baba=S.baba1(:);
t=(0:numel(baba)-1)'*.5; % 12 óránként -> fél nap
figure('Name','Baba – nyers');plot(t,baba,'.-');grid on;xlabel('Nap');ylabel('Tömeg [g]');
% Tanári 2026-os példa: durva hibák eredeti indexe: 13, 41, 49.
bad=[13,41,49];baba(bad)=[];t(bad)=[];
% Kezdeti fogyás, majd 2 lineáris szakasz. Átmeneti pont kihagyva.
baba=baba(7:end);t=t(7:end);
tTej=t(1:23);yTej=baba(1:23);
tTap=t(25:end);yTap=baba(25:end);
tej=fitline_ols(tTej,yTej);tap=fitline_ols(tTap,yTap);
weekTej=7*tej.m;uWeekTej=7*tej.um;
weekTap=7*tap.m;uWeekTap=7*tap.um;
fprintf('Anyatejes heti növekedés: %.3f ± %.3f g/hét\n',weekTej,uWeekTej);
fprintf('Tápszeres heti növekedés: %.3f ± %.3f g/hét\n',weekTap,uWeekTap);
delta=tej.m-tap.m;
if abs(delta)<eps,error('Párhuzamos egyenesek: nincs stabil metszéspont.');end
age=(tap.b-tej.b)/delta;
% Metszéspont t=(b2-b1)/(m1-m2), teljes OLS paraméter-kovarianciával.
db=tap.b-tej.b;
g1=[-db/(delta^2),-1/delta]; % [m1,b1]
g2=[+db/(delta^2),+1/delta]; % [m2,b2]
uAge=sqrt(max(0,g1*tej.cov*g1'+g2*tap.cov*g2'));
fprintf('Tápszerre váltás becsült ideje: %.3f ± %.3f nap (illesztés alapján)\n',age,uAge);
figure('Name','Baba – két szakasz');
plot(t,baba,'.');hold on;
plot(tTej,tej.yhat,'-','LineWidth',1.5);
plot(tTap,tap.yhat,'-','LineWidth',1.5);
xline(age,'k--');grid on;xlabel('Kor [nap]');ylabel('Tömeg [g]');
legend('Tisztított mérések','Anyatejes illesztés','Tápszeres illesztés','Metszéspont');
