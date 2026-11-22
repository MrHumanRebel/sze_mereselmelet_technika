clear all
close all

s_1=zeros(1,100);
s_1(25)=10;s_1(26)=5;s_1(24)=4;

s_2=zeros(1,100);
s_2(30)=5;s_2(31)=3;s_2(29)=2;

figure()
plot(s_1,'r*-')
hold on
plot(s_2,'b+-')
grid on
title('A k�t id�sor')
hold off

[acf_1,tau]=xcorr(s_1,s_1);
[acf_2,tau]=xcorr(s_2,s_2);

[ccf_12,tau]=xcorr(s_1,s_2);

figure()
plot(tau,acf_1,'Linewidth',2)
hold on
plot(tau,acf_2,'r-','Linewidth',2)
plot(tau,ccf_12,'g-','Linewidth',2)
grid on
title('A k�t id�sor ACF-je �s CCF-je')
hold off