% FUVOlA – WAV, legerősebb frekvenciacsúcsok, autokorreláció, Nyquist.
clearvars;close all;clc;setup;
file='fuvola8.wav';if ~isfile(file),error('Másold ide: feladat5/fuvola8.wav');end
[yy,fs]=audioread(file);
if size(yy,2)>1,x=mean(yy,2);else,x=yy;end
x=detrend(x);
[f,A]=one_sided_fft(x,fs);
[pk,val]=local_peaks(A,max(2,round(10/(fs/numel(x)))),0.01*max(A));
good=f(pk)>20;pk=pk(good);val=val(good);
[~,order]=sort(val,'descend');
count=min(3,numel(order));
fprintf('WAV mintavétel: fs=%g Hz; Nyquist=%g Hz; FFT df=%.3f Hz\n',fs,fs/2,fs/numel(x));
for j=1:count
 k=pk(order(j));fprintf('%d. legerősebb spektrális csúcs: %.3f Hz (amp=%.4f)\n',j,f(k),A(k));
end
% Ezek lehetnek felharmonikusok is; nem feltétlenül 3 különböző játszott hang.
N=numel(x);nf=2^nextpow2(2*N-1);
acf=real(ifft(abs(fft(x,nf)).^2));
acf=acf(1:N);acf=acf/max(acf(1),eps);
figure('Name','Fuvola');
subplot(2,1,1);plot(f,A);xlim([0 min(3000,fs/2)]);grid on;
xlabel('Frekvencia [Hz]');ylabel('Amplitúdó');
subplot(2,1,2);
maxlag=min(N,round(.1*fs));plot((0:maxlag-1)/fs,acf(1:maxlag));
grid on;xlabel('Pozitív késés [s]');ylabel('Normált autokorreláció');
