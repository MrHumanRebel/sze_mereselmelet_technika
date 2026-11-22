# Teljesen levezetett MATLAB-vizsgafeladatok IV. – FFT, fuvola, motor, gitár, egyenirányító

## FFT alapszabály
Időlépés Δt=1/fs; mintaszám N; Nyquist=fs/2; frekvenciafelbontás Δf=fs/N.
Valós jelre egyoldali amplitúdó: FFT abszolút értéke osztva N-nel; **kivéve a DC és páros N esetén a Nyquist-komponenst**, a pozitív belső frekvenciákat kétszerezni kell.
Ha a szinusz nem illeszkedik egész számú periódussal a mintavételi ablakba, a legnagyobb bin amplitúdója kevesebb lesz, mint a valódi amplitúdó. Hann-ablak és/vagy szinuszillesztés segíthet.

## A. Fuvola – 5. feladat

**Forrás:** fuvola8.wav, saját fs értékkel a fájl fejlécében; ezt audioread adja, nem találgatjuk.

**Kérdés a)** spektrum, három leghangosabb hang frekvenciája. A teljes WAV-ra one_sided_fft; helyes Hz-tengely; lokális csúcsok zajszűréssel; frekvencia szerint feliratozás. Figyelmeztetés: három erős spektrális csúcs **lehet egy hang alapfrekvenciája és felharmonikusai**, nem biztosan három külön zenei hang. A hosszú felvétel különböző időszakaszaiban más hangok szerepelhetnek, ezért zenei hangok elkülönítéséhez időszakaszos spektrum szükséges.

**Kérdés b)** normált autokorreláció. Lags mintában, másodpercben lags/fs. ACF(0) triviálisan jellemzően 1; az első jelentős pozitív maximumból periodicitás becsülhető.

**Kérdés c)** a fejlécben tárolt fs, Nyquist=fs/2, elméleti legmagasabb visszaállítható frekvencia a Nyquist-korlátnál. A valós anti-alias szűrés és tökéletes sávkorlátozás feltételeit említeni kell.

**MATLAB:** 05_fuvola.m.

## B. Motorhang – 5. konzultációs példa

**Forrás:** motorhang.mat, változók original, used és Fs; ellenőrzött fájladat: Fs=11025 Hz, 20001 minta csatornánként.

**Menet:** külön időgrafikon, DC-levonás, egyoldali FFT; ugyanazon f-tengelyen az eredeti és használt motor spektruma, valamint különbsége. 11025/2=5512.5 Hz a Nyquist. N=20001 mellett Δf≈0.5512 Hz.

**Értelmezés:** ha egy adott sávban erősebb harmonikus van a használt motornál, a működési állapotról következtethetünk, de ez önmagában nem oksági bizonyíték hibára. **MATLAB:** 12_motorhang.m.

## C. Gitár – 5. konzultációs WAV

Hangból WAV import, szükség esetén több csatorna mono átlaga, DC-levonás, FFT, harmonikusok. Az alapfrekvencia **nem feltétlen a legnagyobb FFT-bin**, mert felharmonikus lehet hangosabb.
A saját 13_gitar.m legnagyobb pozitív csúcsot jelöl meg, de ezt nem állítja automatikusan alapfrekvenciának.

## D. Egyenirányító – feladatok.pdf-ben szerepel, de nincs MAT

**Kérdés:** átlagos egyenfeszültség és annak mérési pontossága, valamint periodikus összetevők frekvenciája.

**Menet:** N és fs beolvasása; mean(x) a DC-becslés; a std(x)/√N csak független mérési hibák esetén korrekt közép-SEM. Ha determinisztikus periodikus hullámosság is van, blokkátlagolással vagy időablakmodellel külön becslés indokolt. A hullámosságot x−mean(x) FFT-je tárja fel.

**Saját NEM tanári demó:** fs=2000 Hz, VDC=5 V, 100 Hz hullámosság 0.35 V, 200 Hz komponens 0.12 V és 0.025 V szórású fehér zaj. Megfelelő kódnál 5 V DC és 100/200 Hz körüli csúcsok látszanak. **MATLAB:** 16_egyeniranyito_szimulacio.m. Ez nem az eredeti MAT-fájl, amire az oktatói feladat hivatkozik.

## E. Autospektrum, keresztspektrum és koherencia

PSD ≠ amplitúdóspektrum: a PSD értéke jel²/Hz. Welch: az idősorokat átlapolt szegmensekre bontjuk, ablakoljuk, a periodogramokat átlagoljuk. Keresztspektrum Pxy és autospektrumok Pxx,Pyy alapján a magnitúdó-négyzetes koherencia Cxy=|Pxy|²/(Pxx·Pyy). 0–1 közötti érték becsülhető (átlagolás után); egyetlen nyers FFT-ből kapott koherencia félrevezető lehet.

**MATLAB:** demo_05_fft_korrelacio.m és spectra_welch_local.m. Második kontroll: demo_07_spektralis_szivargas.m, demo_14_aliasing.m.

## Tipikus hibák
Hibás fs; Hz helyett mintaindex a tengelyen; 2x normálás DC-n; T=fs/N keverése Δf=fs/N-nel; hang és harmonikus összekeverése; ablakolás utáni amplitúdó-korrekció kihagyása; PSD egységének rossz leírása.
