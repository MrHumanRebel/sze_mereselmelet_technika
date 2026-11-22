% Tanári 1. konzultáció: inga_lengesideje.m eredeti számai.
clearvars;close all;clc;setup;
T=[29.729,26.711,27.787,26.457,27.158,27.200,28.801,...
34.318,28.157,26.264,27.404,28.274,28.964,29.513,28.193]';
before=measurement_stats(T);
[clean,keep,removed]=clean_rows_sigma(T,3);
after=measurement_stats(clean);
fprintf('Nyers: x=%.5f, s=%.5f, SEM=%.5f\n',before.mean,before.std,before.sem);
fprintf('Tisztított: x=%.5f, s=%.5f, SEM=%.5f\n',after.mean,after.std,after.sem);
fprintf('Kizárt eredeti index: %s (tanári kulcs: 8)\n',mat2str(removed'));
assert(any(removed==8),'A tanár a 8. mérést kezeli durva hibaként.');
figure('Name','Inga minta');
subplot(2,1,1);plot(T,'o');hold on;
yline(before.mean,'k-');yline(before.mean+3*before.std,'r--');
yline(before.mean-3*before.std,'r--');grid on;
xlabel('Mérés sorszáma');ylabel('T [forrás-egység]');
subplot(2,1,2);plot(find(keep),T(keep),'bo');hold on;
plot(find(~keep),T(~keep),'rx','MarkerSize',12);
yline(after.mean,'k--');grid on;xlabel('Eredeti index');ylabel('T [forrás-egység]');
