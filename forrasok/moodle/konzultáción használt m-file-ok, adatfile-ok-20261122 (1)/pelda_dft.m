
%DFT-s video: https://www.youtube.com/watch?v=mkGsMWi_j4Q

clear all
close all

Fs = 11; %Nyquist-frequency: 5,5 = Fs/2
N = 144;

t = (0:N-1)*1/Fs; %idotengely letrehozasa
x = 2*sin(2*pi*1*t)+3*cos(2*pi*2*t); %zaj nelkuli jel


t_folyt = (0:0.01:N-1)*1/Fs; %szinte folytonos idotengely letrehozasa
x_folyt = 2*sin(2*pi*1*t_folyt)+3*cos(2*pi*2*t_folyt); %A*sin(2*pi*f*t)

plot(t,x,'*') %kek csillagok a mert pontok
hold on
plot(t_folyt,x_folyt,'r') %piros szinnel a folytonos jelalak
xlabel('Time [s]')
ylabel('Amplitude [a.u.]')
title('Sin+cos signal')
hold off

x_k = zeros(1,N); %x_k definialasa (csupa nulla elemekbol egy N hosszu sorvektor)

for k=0:N-1
   
    for n=0:N-1 
       x_k(k+1) = x_k(k+1) + x(n+1)*exp(1)^(1i*2*pi*k*n/N); %x(n+1): mert a matlabban nincs 0. eleme a matrixnak
    end
    
end

Magnitudes = abs(x_k)/N;

dF = Fs/N; %frekvencia felbontas egysege
f = dF*(0:N-1); %frekvencia tengely letrehozasa
figure(2)
plot(f,Magnitudes)
xlabel('Frequency [Hz]')
ylabel('Amplitude [a.u.]')
title('Double-sided Frequency spectrum with DFT')


fper2 = dF*(0:(N-1)/2);
Mags = 2*Magnitudes(1:N/2);
figure(3)
plot(fper2,Mags)
xlabel('Frequency [Hz]')
ylabel('Normalized amplitude [a.u.]')
title('One-sided Frequency spectrum with DFT')


%osszehasonlitas a matlab beepitett FFT fuggvenyevel
Y = fft(x);
P2 = abs(Y)/N;
P1 = P2(1:N/2+1);
P1(1:end-1) = 2*P1(1:end-1);

figure(4)
plot(fper2,P1(1:end-1))
xlabel('Frequency [Hz]')
ylabel('Normalized amplitude [a.u.]')
title('Frequency spectrum with FFT')


