# MATLAB nulláról – 20 perc alatt magabiztos alapok

## Telepítés és jogosultság
Az egyetem Moodle-fájljában (MATLAB hallgatói hozzáférés.pdf) az Office 365-ös SZE-fiókos hozzáférést írják. Ha van egyetemi licenced, használd a MATLAB-ot. A közös/core függvényekhez alap-MATLAB kell; néhány tanári példában szereplő sgolayfilt, findpeaks, xcorr a Signal Processing Toolbox része lehet. Emiatt a saját common-függvényeink ezekre is kínálnak toolbox nélküli megoldást. A részletes vizsgán elérhető toolboboxokat a labor környezete dönti el.

## Öt alapparancs
~~~matlab
clearvars; close all; clc;
x = [1, 2, 3, 4];         % sorvektor
x = x(:);                  % oszlopvektor, sok függvény ezt várja
n = numel(x);
atlag = mean(x);
szoras = std(x,0);         % korrigált mintaszórás: n-1 osztó
kozephiba = szoras/sqrt(n);
~~~

## Minta: betöltés és ábra
~~~matlab
S = load('teglatest1.mat');
whos('-file','teglatest1.mat')
a = S.a(:);
figure; plot(a,'.-'); grid on;
xlabel('Mérés sorszáma'); ylabel('a [adott egység]');
~~~
A .mat fájlt nem a repóban keresem: a feltöltött Moodle ZIP-ből kell a MATLAB példákkal azonos mappába másolni, vagy addpath-al elérhetővé tenni.

## Vektor, pontonkénti művelet
~~~matlab
x = (1:5)';
y = x.^2;      % helyes: elemenkénti hatvány
z = x.*y;      % elemenkénti szorzás
a = x./(y+1);  % elemenkénti osztás
~~~
**Gyakori hiba:** ^ * / mátrixműveletek; adatvektorokra általában .^ .* ./ kell.

## Gyors grafikon
~~~matlab
t = (0:999)'/1000;
y = 2*sin(2*pi*50*t);
figure; plot(t,y); grid on;
xlabel('Idő [s]'); ylabel('Jel [egység]');
title('50 Hz-es szinusz');
~~~

## Első indítás
1. Állítsd Current Folder-t a repó matlab mappájára.
2. Futtasd: run('setup.m').
3. Futtasd: run('run_tests.m'). Az ellenőrzések PASS státusszal záruljanak.
4. Futtasd: run('demo_01_statisztika.m'), majd demo_02, …, demo_05.
5. A peldatar szkriptekhez másold az adott .mat/.wav fájlt a Current Folderbe. Az eredeti oktatói adatfájlokat nem publikáljuk a nyilvános repóba.

## Gyors parancsszótár
- who/whos: változók; size/numel: méret; mean/std/median: statisztika.
- load/audioread: MAT és WAV; plot/figure/grid/xlabel/ylabel/legend: ábrák.
- sort/find: indexelés; x(idx)=[]: törlés (páros mért adatsorok indexét szinkronban kell tartani).
- fft/abs/angle: Fourier; polyfit vagy X\y: egyenesillesztés.
- help függvénynév: MATLAB súgó.
- fprintf('%.3f Hz\n',f): kimenet.

## Fájlok felépítése
- common/: ellenőrizhető segédfüggvények, beépített toolbox-függvények helyettesítésére.
- demo_*.m: szintetikus adatok, mindig futtathatók.
- peldatar/: konkrét oktatói példák, **az eredeti adatok helyi másolásával**.
- run_tests.m: alap matematikai smoke tesztek.
