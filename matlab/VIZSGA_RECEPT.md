# MATLAB döntési fa – bemenet alapján felismerem a megoldást

## 0. Minden feladathoz ugyanaz az első 10 sor
~~~matlab
clearvars; close all; clc;
setup; % a matlab mappából futtatva
S = load('adat.mat');    % a feladat tényleges fájlneve
disp(fieldnames(S));     % soha ne találgassam a változókat
whos('-file','adat.mat')
% Az adatokból x = S.valtozonev(:), majd időtengely vagy index:
% figure; plot(x,'.'); grid on;
~~~
Egységek, n, hiányzó adat és outlier-vizsgálat után számolok tovább.

## A. A feladat azt kérdezi: átlag, szórás, durva hiba?
- Oszlopok: ha egy sor egy fizikai objektumot jelent, együtt kell megtartani/eldobni.
- **clean_rows_sigma(X,3)**; nagy n és természetes 3σ-kilógások esetén indokolt lehet 4σ.
- Ez **heurisztika**, nem bizonyíték; ellenőrzöm a feladat grafikáján.
- measurement_stats(x): .mean, .std, .sem. Döntsem el, mi a kért szórás.

## B. Térfogat, sűrűség, tömeg, tehetetlenségi nyomaték?
1. Fizikai képlet.
2. Minden adatot kompatibilis mértékegységre konvertálok.
3. Minden bemeneti mérésre outlier check.
4. Analitikus parciális deriváltak.
5. Ha összetartozó minták: Cov és u²=J·Cov·Jᵀ; független bemeneteknél a diagonális elég.
6. Átlag bizonytalanságánál CovMean = Cov/n, egyedi gyártási szóráshoz CovIndividual.

## C. Nemlineáris kapcsolat/„illesztés”?
- y=mx+b: fitline_ols(x,y).
- y=A0·e^(−k·t): log(y)=b+m*t; A0=e^b; k=−m; T=ln(2)/k.
- Nyomás: log(p)=b+m*h; kizárólag p>0 pontokra.
- Az illesztett slope/intercept **kovariált**; a visszaalakított kimenetre Jacobian-alapú bizonytalanságot számolok.

## D. Zajos időjel, trend, rezgés?
- t=(0:N−1)/fs; plot(t,x).
- detrend(x) vagy csak x−mean(x), a trend jellegétől függően.
- Sima mozgóátlag: moving_average_local(x,11); SG: sgolay_local(x,11,3).
- Csúcsok: local_peaks, minDistance fizikai indoklással.
- Két egymás utáni csúcs: T=medián(Δt), f=1/T.
- Legyen **előtte-utána** ábra.

## E. FFT, hangok, harmonikusok?
- [f,A]=one_sided_fft(x,fs); plot(f,A).
- Nyquist=fs/2, df=fs/N, időablak=N/fs.
- Kiválasztok csúcsot, de az 50 Hz és 100 Hz lehet egy hang alapfrekvenciája + felharmonikus is.
- FFT amplitúdója rácshatás, zaj és ablakolás miatt eltérhet a valódi amplitúdótól.
- PSD kell? spectra_welch_local(x,y,fs,M) → Pxx, Pyy, Pxy, coherence.

## F. Két időjel, jel-visszhang?
- echo_delay_local(x,y,fs,v,window)
- Ha különösen zajos a CCF, próbálj simítást, pl. 41 vagy 81 mintát; az oktatói szonár esetben 81.
- lag **mintában** → Δt=|lag|/fs → d=vΔt/2.
- Ha egyirányú repülésről van szó, nem kell 2-vel osztani! A fizikai modell dönti el.
- Korreláció alakja és a hasznos csúcs fizikai értelmezése kötelező.

## G. Fájltípusok
- MAT: S=load('file.mat'), disp(fieldnames(S)).
- WAV: [signal,fs]=audioread('file.wav').
- CSV: data=readmatrix('file.csv'); régi verzióban csvread, de fejléc esetén óvatosan.
- XLSX: readmatrix; eredeti segédanyagban villanymotor.xlsx, ez haladó kiegészítő.

## H. Mit adok le?
Futtatható script, minden szükséges adatfájl, mappa az oktató által kért névvel, képletek kommentekben, eredmény konzolra, ábrák címmel/tengelyekkel/egységgel. A 2024-es dokumentum szerint a vizsgahelyszínen kijelölt mappába kell másolni, és a Moodle állományai használhatók.

## MATLAB hibák fél perc alatt
- „Unrecognized function or variable”: Current Folder, addpath, helyes írásmód.
- Mátrixdimenzió-hiba: x(:), y(:), size, és .*, ./, .^.
- Komplex/logaritmus: log(y) előtt y>0.
- Fura spektrum: fs hibás, kétoldali/egyoldali normalizálás, DC, Nyquist, N.
- Fura korreláció: x és y argumentumsorrendje, xcorr lag előjele, detrend és simítás.
- Inf/NaN: hiányzó adatok, osztás nullával, log 0.
- Hullámzó derivált: analitikus derivált előnyben; véges differencia lépésközét konvergenciateszttel igazold.

**Nincs vak másolás:** először feladat típus, utána saját változónevek és egységek.
