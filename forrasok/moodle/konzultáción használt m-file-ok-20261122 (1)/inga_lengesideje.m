clear all
%eloadas diasoraban talalhato feladat megoldasanak kezdete
T=[29.729,26.711,27.787,26.457,27.158,27.200,28.801,34.318,28.157,26.264,27.404,28.274,28.964,29.513,28.193];


n=[1:length(T)];

avg_T=mean(T);
szoras_T=std(T);
atlag_szorasa=std(T)/sqrt(length(T)); %atlag bizonytalansaganak becslese

%ellenorzes, hogy az adatokban van-e durva meresi hiba, amit ki kell venni
%itt eleg a 3 szigman beluli vizsgalat
for i=1:length(n)
   atlag_vonal(i)=avg_T;
   also_hatar(i)=avg_T-3*szoras_T;
   felso_hatar(i)=avg_T+3*szoras_T;
end

%eredmenyek vizualis megjelenitese: tortent durva hiba a meres soran (8. adat)!
figure(1)
plot(n,T,'r*')
grid on
hold on
plot(n,atlag_vonal,'r-','LineWidth',3)
plot(n,also_hatar,'g-','LineWidth',3)
plot(n,felso_hatar,'g-','LineWidth',3)


