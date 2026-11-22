% EXTRA konzultáció: (rpm, Nm, hatásfok) ismétlések mediánja.
% Forrás: villanymotor.mat/ adat okmotor? -> tényleges változónév: adatokmotor.
clearvars;close all;clc;setup;
if ~isfile('villanymotor.mat'),error('Másold ide a villanymotor.mat fájlt!');end
S=load('villanymotor.mat');
if ~isfield(S,'adatokmotor'),error('A MAT-ban adatokmotor mező szükséges.');end
raw=double(S.adatokmotor);
grouped=group_median_pairs(raw);
fprintf('Nyers sor: %d, egyedi (rpm,Nm) pár: %d.\n',size(raw,1),size(grouped,1));
% Az oktatói példa szerint a 4 legutolsó feldolgozott sor hiányos mérés.
excludeLastFour=true;
if excludeLastFour
  grouped(end-3:end,:)=[];
  fprintf('Oktatói forrás alapján utolsó 4 csoport kizárva.\n');
end
smoothData=grouped;uniqueRPM=unique(grouped(:,1));
for i=1:numel(uniqueRPM)
 rows=find(grouped(:,1)==uniqueRPM(i));
 [~,sortIdx]=sort(grouped(rows,2));ordered=rows(sortIdx);
 if numel(rows)>=3
  smoothData(ordered,3)=moving_average_local(grouped(ordered,3),3);
 end
end
opt=max_per_first_column(smoothData);
[best,j]=max(opt(:,3));
fprintf('Feldolgozott mező globális hatásfokmaximum: rpm=%.1f, Nm=%.3f, eta=%.4f\n',...
 opt(j,1),opt(j,2),best);
figure('Name','Villanymotor-hatásfok');
subplot(1,2,1);scatter3(smoothData(:,1),smoothData(:,2),smoothData(:,3),8,smoothData(:,3),'filled');
hold on;plot3(opt(:,1),opt(:,2),opt(:,3),'ro');grid on;
xlabel('Fordulatszám [rpm]');ylabel('Nyomaték [Nm]');zlabel('Hatásfok');
subplot(1,2,2);plot(opt(:,1),opt(:,3),'o-');grid on;
xlabel('Fordulatszám [rpm]');ylabel('Legjobb hatásfok');
