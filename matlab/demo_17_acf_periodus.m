% ACF: nulla késésnél triviális maximum; periódust pozitív lagból becsülünk.
clearvars;close all;clc;setup;
rng(17);fs=100;t=(0:2000)'/fs;trueF=2.5;
x=sin(2*pi*trueF*t)+.15*randn(size(t));
[lag,acf]=acf_fft_local(x,200,false);
positive=lag>=round(fs/(2*trueF));
ii=lag(positive);yy=acf(positive);
[pks,val]=local_peaks(yy,round(fs/(trueF*2)),.2);
if isempty(pks),error('ACF csúcskeresés sikertelen.');end
[~,ix]=max(val);periodSamples=ii(pks(ix));
fprintf('ACF periódus %.4f s, frekvencia %.4f Hz (eredeti %.1f Hz)\n',...
periodSamples/fs,fs/periodSamples,trueF);
figure;plot(lag/fs,acf);grid on;
xlabel('Késés [s]');ylabel('Normált ACF');title('ACF és időperiodicitás');
