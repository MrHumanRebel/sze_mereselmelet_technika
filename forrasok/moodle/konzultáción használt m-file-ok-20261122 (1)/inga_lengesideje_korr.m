
clear all
%eloadas diasoraban talalhato feladat megoldasanak folytatasa
T=[29.729,26.711,27.787,26.457,27.158,27.200,28.801,34.318,28.157,26.264,27.404,28.274,28.964,29.513,28.193];
T(8)=[]; %8. elem, a durva hiba torlese az adatsorbol, mindent ujra kell szamolni, amig
%durva hiba mentes nem lesz az adatsor!
n=[1:length(T)];

avg_T=mean(T);
szoras_T=std(T);
atlag_szorasa=std(T)/sqrt(length(T));

for i=1:length(n)
   atlag_vonal(i)=avg_T;
   also_hatar(i)=avg_T-3*szoras_T;
   felso_hatar(i)=avg_T+3*szoras_T;
end

figure(2)
plot(n,T,'r*')
grid on
hold on
plot(n,atlag_vonal,'r-','LineWidth',3)
plot(n,also_hatar,'g-','LineWidth',3)
plot(n,felso_hatar,'g-','LineWidth',3)