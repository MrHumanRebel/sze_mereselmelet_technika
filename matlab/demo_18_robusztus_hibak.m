% Összevetés: mean/std és median/MAD ugyanazon hibás minta esetén.
clearvars;close all;clc;setup;
rng(18);x=10+.2*randn(101,1);x(11)=200;
meanValue=mean(x);stdValue=std(x);
[robustFlag,robustMedian,robustSD]=mad_outlier_indices(x,3.5);
[sigmaClean,~,removed]=clean_rows_sigma(x,3);
fprintf('Nyers mean=%.3f, std=%.3f; median=%.3f, scaledMAD=%.3f\n',...
meanValue,stdValue,robustMedian,robustSD);
fprintf('MAD jelölt indexek: %s; iteratív 3-sigma jelöltek: %s\n',...
mat2str(find(robustFlag)'),mat2str(removed'));
fprintf('MAD és sigma csak diagnosztika: a kizárást fizikailag indokolni kell.\n');
figure;plot(x,'.');hold on;plot(find(robustFlag),x(robustFlag),'ro');
grid on;xlabel('Minta');ylabel('Mért érték');
