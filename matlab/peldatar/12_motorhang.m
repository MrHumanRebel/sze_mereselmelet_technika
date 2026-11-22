% MOTORHANG – eredeti és használt motorhang összehasonlítása.
clearvars;close all;clc;setup;
file='motorhang.mat';if ~isfile(file),error('Másold ide: motorhang.mat');end
S=load(file);fs=S.Fs;
[f,A]=one_sided_fft(S.original,fs);
[~,B]=one_sided_fft(S.used,fs);
fprintf('Fs=%.1f Hz, Nyquist=%.1f Hz, df=%.3f Hz\n',fs,fs/2,fs/numel(S.original));
figure('Name','Motorhang spektruma');
subplot(3,1,1);plot(f,A);grid on;title('Eredeti');
subplot(3,1,2);plot(f,B);grid on;title('Használt');
subplot(3,1,3);plot(f,B-A);grid on;title('Amplitúdóspektrum különbsége');
xlabel('Frekvencia [Hz]');
