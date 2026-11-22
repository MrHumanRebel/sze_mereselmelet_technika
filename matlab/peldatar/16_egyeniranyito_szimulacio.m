% A feladatok.pdf egyenirányítós problémájának SZINTETIKUS megfelelője.
% Az eredeti egyeniranyito.mat NEM volt a feltöltött archívumban.
% Szimulált jel: 5 V DC + 100 Hz, 200 Hz harmonikus + fehér zaj.
clearvars;close all;clc;setup;
rng(2026);fs=2000;N=5000;t=(0:N-1)'/fs;
x=5+.35*sin(2*pi*100*t)+.12*sin(2*pi*200*t)+.025*randn(N,1);
dc=mean(x);sx=std(x,0);semNaive=sx/sqrt(N);
% A hullámosság korrelált, ezért a sima s/sqrt(n) SEM nem feltétlen korrekt.
% Egész 100 Hz periódusonként külön átlagokat készítünk.
period=fs/100;
assert(period==floor(period),'Egész periódusú blokk kell.');
nr=floor(N/period);
block=reshape(x(1:nr*period),period,nr);
blockMean=mean(block,1);
semBlock=std(blockMean,0)/sqrt(nr);
[f,A]=one_sided_fft(x-mean(x),fs);
[idx,value]=local_peaks(A,round(20/(fs/N)),.04);
[~,order]=sort(value,'descend');
fprintf('SZINTETIKUS DEMÓ: V_DC=%.4f V; nyers s=%.4f V\n',dc,sx);
fprintf('Naiv SEM=%.5f V, periódusblokkok SEM=%.5f V\n',semNaive,semBlock);
for j=1:min(4,numel(order))
 i=idx(order(j));fprintf('Harmonikus csúcs: %.2f Hz, %.3f V\n',f(i),A(i));
end
fprintf('Nyquist=%.1f Hz; FFT df=%.2f Hz\n',fs/2,fs/N);
figure('Name','Egyenirányító (szintetikus)');
subplot(2,1,1);plot(t(1:120),x(1:120));grid on;xlabel('t [s]');ylabel('U [V]');
subplot(2,1,2);plot(f,A);xlim([0 500]);grid on;
xlabel('Frekvencia [Hz]');ylabel('Amplitúdó [V]');
