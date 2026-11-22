% Trend + rezgés + fehér zaj; trendlevonás és SG.
clearvars;close all;clc;setup;
rng(3);fs=20; t=(0:999)'/fs; f0=1.2;
x=3+.015*t+sin(2*pi*f0*t)+0.35*randn(size(t));
xDet=detrend(x);smooth=sgolay_local(xDet,15,3);
[pk,~]=local_peaks(smooth,round(fs*.65),.35);
if numel(pk)>=2
    T=median(diff(t(pk)));fprintf('Csúcsokból T≈%.3f s, f≈%.3f Hz\n',T,1/T);
end
figure('Name','Időjelek');plot(t,x,'Color',[.75 .75 .75]);hold on;
plot(t,xDet,'b-');plot(t,smooth,'r-','LineWidth',1.3);
plot(t(pk),smooth(pk),'ko');grid on;
xlabel('Idő [s]');ylabel('Kitérés [egység]');
legend('Eredeti + trend','Trend nélkül','SG simított','Csúcs');
