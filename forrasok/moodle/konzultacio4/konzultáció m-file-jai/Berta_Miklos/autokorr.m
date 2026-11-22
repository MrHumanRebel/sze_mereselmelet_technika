clear all
close all

load 'non_stat_signal.mat';

jel_mod=detrend(jel,'linear');
 
[acf,tau]=xcorr(jel,jel);
[acf_mod,tau]=xcorr(jel_mod,jel_mod);

figure()
plot(tau,acf,'r-','LineWidth',2)
grid on
hold on
plot(tau,acf_mod,'g-','LineWidth',2)