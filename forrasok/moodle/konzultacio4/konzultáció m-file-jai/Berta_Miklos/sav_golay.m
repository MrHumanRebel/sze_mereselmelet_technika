clear all
close all

load 'non_stat_signal.mat';

jel_mod=detrend(jel,'linear');
jel_simit=smooth(jel_mod,151,'sgolay',2);

figure()
plot(time,jel_mod,'r-')
grid on
hold on
plot(time,jel_simit,'b-','LineWidth',2)
title('Golay - Savitzky simítás')
hold off