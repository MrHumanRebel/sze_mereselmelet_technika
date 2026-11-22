% 4. konzultációs nemstacionárius jel, valós MAT-tal vagy explicit demóval.
clearvars;close all;clc;setup;
if isfile('non_stat_signal.mat')
 S=load('non_stat_signal.mat');
 if ~isfield(S,'jel'),error('A MAT-ban nincs jel.');end
 x=double(S.jel(:));
 fprintf('Eredeti Moodle non_stat_signal.mat betöltve.\n');
else
 rng(2026);t=(0:1199)';
 x=2+.004*t+sin(2*pi*t/50)+.35*randn(size(t));
 fprintf('SZINTETIKUS MODELL: a non_stat_signal.mat nem található.\n');
end
xd=detrend(x);
[lags,aRaw]=acf_fft_local(x,min(200,numel(x)-1),false);
[~,aDet]=acf_fft_local(xd,min(200,numel(x)-1),false);
figure('Name','Trend és ACF');
subplot(2,1,1);plot(x,'Color',[.7 .7 .7]);hold on;
plot(xd,'b');grid on;xlabel('Mintasorszám');ylabel('Jel');
legend('Eredeti','Detrend');
subplot(2,1,2);plot(lags,aRaw,'r',lags,aDet,'b');
grid on;xlabel('Késés [minta]');ylabel('Normált ACF');
legend('Eredeti','Detrend');
