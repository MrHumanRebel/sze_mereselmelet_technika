% REZGÉS – jel tizedmásodpercenként, SG és FFT, periódus/amplitúdó.
clearvars;close all;clc;setup;
file='rezges5.mat';if ~isfile(file),error('Másold ide: rezges5.mat');end
S=load(file);x=S.jel(:);fs=10;t=(0:numel(x)-1)'/fs;
xd=detrend(x);
xs=sgolay_local(xd,11,3);
% Min. távolság célzottan a képről és fizikai becslésből változtatandó.
minDist=7;[peaks,~]=local_peaks(xs,minDist,0);
if numel(peaks)>=2
 Tpeaks=median(diff(t(peaks)));fpeaks=1/Tpeaks;
else
 Tpeaks=NaN;fpeaks=NaN;
end
[fr,A]=one_sided_fft(xd,fs);
valid=fr>0;
fv=fr(valid);Av=A(valid);
[amp,im]=max(Av);f_fft=fv(im);T_fft=1/f_fft;
fprintf('Csúcsidők: T=%.3f s, f=%.3f Hz\n',Tpeaks,fpeaks);
fprintf('FFT: f=%.4f Hz; T=%.4f s; amplitúdó kb. %.4f m (spektrális csúcs)\n',f_fft,T_fft,amp);
fprintf('FFT df=%.4f Hz, Nyquist=%.1f Hz\n',fs/numel(x),fs/2);
figure('Name','Rezgés');
subplot(2,1,1);plot(t,x,'Color',[.7 .7 .7]);hold on;plot(t,xs,'b');
plot(t(peaks),xs(peaks),'ro');grid on;legend('Mérés','SG','Csúcs');
xlabel('Idő [s]');ylabel('Kitérés [m]');
subplot(2,1,2);plot(fr,A);xlim([0 5]);grid on;
xlabel('Frekvencia [Hz]');ylabel('Amplitúdó [m]');
