# Vizsgafeladat-megoldások, valós Moodle-adatokhoz

**Használat:** futtasd a matlab/setup.m scriptet, majd az adott feladathoz tartozó .m fájlt. A tanári ZIP-ekből másold a forrás .mat/.wav állományt a MATLAB Current Folderbe (vagy lépj arra a mappára). A repo nem publikálja a Moodle-on megosztott tanári állományokat.

| Script | Eredeti adatfájl | Feladattípus |
|---|---|---|
| 01_teglatest.m | gyakorlo_peldak/feladat1/teglatest1.mat | Durva hibák, méretek, sűrűség, hibaterjedés |
| 02_korkup.m | gyakorlo_peldak/feladat2/korkup1.mat | Kúptömeg és bizonytalanság, mm→m |
| 03_rezges.m | gyakorlo_peldak/feladat3/rezges5.mat | SG, csúcskeresés, FFT |
| 04_visszhang_szikla.m | gyakorlo_peldak/feladat4/hang_jelek.mat | 1 kHz, 340 m/s |
| 05_fuvola.m | gyakorlo_peldak/feladat5/fuvola8.wav | WAV, legnagyobb spektrális csúcsok, ACF |
| 06_barometer.m | gyakorlo_peldak/feladat6/barometer.mat | Ln-linearizálás, a modellparaméterek bizonytalansága |
| 07_szferoid.m | otthoni gyakorláshoz/szferoid1.mat | Ellipszoid, térfogat, sűrűség |
| 08_baba.m | konzultáción használt fájlok/baba1.mat | Szakaszos regresszió, váltási idő |
| 09_radioaktiv.m | otthoni gyakorláshoz/rad_bomlas.mat | Exponenciális bomlás |
| 10_cso.m | otthoni gyakorláshoz/cso_adatok.mat | Tömeg és tehetetlenségi nyomaték |
| 11_szonar.m | vizsgafeladat és megoldása/hang_jelek1.mat | 22 kHz, 1500 m/s, keresztkorreláció |
| 12_motorhang.m | 5. konzultáció/motorhang.mat | Két jel spektrumkülönbsége |
| 13_gitar.m | 5. konzultáció/guitar_A.wav | WAV spektrum |
| 14_egyeniranyito_sablon.m | külön beszerezhető egyeniranyito.mat | DC + harmonikus keresés, csak ha adat rendelkezésre áll |

### Forrás és feladat közötti különbség
- A **szonár** tanári megoldásában a nyers keresztkorrelációt 81 pontosan simítják. A nyers legnagyobb csúcs a feltöltött adatokon **nem** a helyes fizikai válaszhoz vezet; ezért a mi megoldásunknál a csúcsválasztás előtt ugyanígy simítunk, és kontrollként vizuálisan is ellenőrzünk.
- A **barométer** oktatói magyarázata szerint a forrásadatok önkényes mértékegységekben vannak; így nem szabad automatikusan SI egységű légsűrűséget állítani. A fizikai modell csak akkor értelmezhető egyértelműen SI-ban, ha a konverzió ismert.
- A **baba** konkrét outlier/szegmentálási határait a feltöltött 2026-os tanári mintamegoldás használja. Vizsgán új adatsornál **nem** ezeket az indexeket kell vakon átvenni.
- A **cső** dimenzióinál 2000, sűrűségénél csak 25 mérés szerepel; ennek megfelelően külön becsüljük a közép szórását.
- A visszhang távolságának becslési tartományát nem szabad dokumentálás nélkül standard szórásnak nevezni.

### Értékelői checklist
Minden szkriptben legyen bemeneti ellenőrzés, grafikon, számítás, egység, bizonytalanság és legalább egy értelmező komment. Ha az adatfájl nincs jelen, a script szándékosan hibát ad – nem gyárt helyette hamis adatokat.
