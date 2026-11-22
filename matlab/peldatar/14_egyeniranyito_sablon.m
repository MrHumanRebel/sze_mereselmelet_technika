% EGYENIRÁNYÍTÓ – a feladat a feladatok.pdf-ben szerepel,
% de egyeniranyito.mat NEM volt az átadott Moodle-archívumban.
% Ez szándékosan SABLON, nem állít elő fiktív eredményt.
clearvars;close all;clc;setup;
file='egyeniranyito.mat';
if ~isfile(file)
    fprintf('Ehhez külön be kell szerezni az egyeniranyito.mat adatfájlt.\n');
    fprintf('Kiértékelés menete: változók -> időtengely -> DC átlag/SEM -> detrend -> FFT -> csúcsok.\n');
    return
end
S=load(file);disp(fieldnames(S));
error(['A forrás változóneve és mintavételi frekvenciája nincs igazolva. ',...
       'Nézd meg a betöltött mezőket és a feladat szövegét, és ezek után állítsd be!']);
