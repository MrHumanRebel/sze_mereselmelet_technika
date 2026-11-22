% Statisztika és durva hiba – a legrövidebb működő mintapélda.
clearvars;close all;clc;
setup;
rng(1);
x=10+0.3*randn(100,1);
x(17)=21; % szándékosan durva eltérés
[a,keep,removed]=clean_rows_sigma(x,3);
before=measurement_stats(x);
after=measurement_stats(a);
fprintf('Törölt eredeti indexek: %s\n',mat2str(removed'));
fprintf('Előtte: átlag %.4f, szórás %.4f\n',before.mean,before.std);
fprintf('Utána: átlag %.4f, szórás %.4f, közép hibája %.4f\n',after.mean,after.std,after.sem);
figure('Name','Statisztika');plot(x,'.');hold on;plot(find(~keep),x(~keep),'ro','MarkerSize',10);
yline(after.mean,'k--');grid on;xlabel('Mérés sorszáma');ylabel('x [egység]');
title('Durva hiba vizsgálata');legend('Összes adat','Kiszűrt adat','Tisztított átlag');
