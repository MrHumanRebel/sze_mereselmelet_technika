clear all
close all

load 'non_stat_signal.mat';

figure()
plot(time,jel,'r-')
grid on
hold on

jel_mod=detrend(jel,'linear'); % jel_mod=detrend(jel)
plot(time,jel_mod,'g-')
title('Lineáris detrendelés')
hold off