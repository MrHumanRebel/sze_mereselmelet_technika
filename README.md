# Méréselmélet és -technika – FULL VIZSGA GRIND

**Széchenyi István Egyetem · GKLM_FKTM013 · 2026/27/1 · levelező**

Na, itt nem az a terv, hogy a vizsga előtt fél órával ránézek pár PDF-re, aztán reménykedem. Ez a repó konkrétan arra van, hogy **nulláról eljussak a két vizsgarész teljesítéséig**. Sorrendben megtanulom a fizikát/matekot, megértem a MATLAB-kódot, aztán időre megoldok komplett példákat.

## Start itt
1. **[Hogyan tanuljam?](elmelet/00_HOGYAN_TANULJAM.md)** – sorrend, saját szabályok.
2. **[16 elméleti tétel, 1–6](elmelet/01_06_meres_es_eloszlasok.md)** – mérés, bizonytalanság, statisztikai modellek.
3. **[16 elméleti tétel, 7–12](elmelet/07_12_statisztika_regresszio.md)** – átlag, hibaterjedés, regresszió.
4. **[16 elméleti tétel, 13–16](elmelet/13_16_idojel_fft.md)** – korreláció, trend, SG, Fourier, spektrumok.
5. **[MATLAB nulláról](matlab/00_KEZDES.md)** – telepítés, parancsok, első indítás.
6. **[Valódi feladattár](matlab/peldatar/README.md)** – 14 konkrét gyakorló- és mintafeladat.
7. **[MATLAB vizsgareceptek](matlab/VIZSGA_RECEPT.md)** – melyik feladattípushoz melyik számolás.
8. **[Papíros számpéldák](elmelet/PAPIROS_FELADATOK.md)** + **[képletlap](elmelet/KEPLETLAP.md)**.
9. **[40 visszakérdező](elmelet/AKTIV_FELIDEZES.md)** + **[próbavizsgák](vizsga/02_PROBAVIZSGAK.md)**.
10. **[7 napos felkészülési terv](vizsga/03_7_NAPOS_TERV.md)**.

## Tényleges vizsgaszabály a feltöltött vizsgarend alapján
- **Számítógépes MATLAB:** 120 perc, mérési adat feldolgozása.
- **Írásbeli elmélet:** 30 perc, kijelölt tétel.
- Mindkettőn legalább **40%**, az átlagban minimum **50%** kell a ketteshez.
- 50–59%: 2, 60–74%: 3, 75–84%: 4, 85% fölött: 5.
- **Megjegyzés:** a 2026/27-es tematika szóbeli elemet is említ, míg a részletes 2024-es vizsgarend MATLAB + írásbeli formát ír. Az aktuális lebonyolítást a tanárral kell egyeztetni.

## MATLAB quickstart
~~~matlab
cd('A_REPOD_HELYE/matlab')
run('setup.m')
run('run_tests.m')
run('demo_01_statisztika.m')
run('demo_02_hibaterjedes.m')
run('demo_03_regresszio.m')
run('demo_04_idojel.m')
run('demo_05_fft_korrelacio.m')
~~~
Ezután másold a **saját Moodle-letöltésedben lévő MAT/WAV fájlokat** a MATLAB aktuális munkamappájába, és futtasd például:
~~~matlab
run('peldatar/09_radioaktiv.m')
run('peldatar/11_szonar.m')
~~~

## Mi van ténylegesen itt?
- 16 hivatalos elméleti témakör magyarázva, képletekkel és gyakori hibákkal.
- Kiegészítő 2026/27-es témák: konfidenciaintervallum, ADC, koherencia stb.
- Papíron végigszámolt példák, képletlap, tanulókártyák.
- MATLAB-függvények: outlier-kezelés, statisztika, OLS paraméterhibákkal és kovarianciával, SG, mozgóátlag, csúcsdetektálás, FFT, FFT-alapú korreláció, Welch PSD/CSD/koherencia.
- Önállóan futtatható szintetikus demók és a konkrét tanári feladatokhoz illesztett szkriptek.
- Smoke tesztek MATLAB-kódban.
- Forrásaudit: **[FORRASOK_ES_LEFEDETSEG.md](FORRASOK_ES_LEFEDETSEG.md)**.

## Ami fontos, mert ezen tényleg lehet bukni
**Mérési szórás ≠ átlag standard hibája.** A durva hibát nem elég megjelölni, indokoltan kezelni kell, majd újraellenőrizni. A korreláció lags tengelye mintákban van. Az FFT-hez frekvenciatengely kell. A nemlineáris modell fizikai paramétereinek szórását is ki kell számolni.

**A saját Moodle-adatfájljaid nem kerültek a nyilvános repóba.** Az egyetemi PDF-ek és MAT/WAV fájlok szerzői jogát nem tudom igazolni, ezért csak az eredeti, saját kidolgozást publikáltam. A tanuláshoz az adatokat a feltöltött archívumból helyben használom.

**Ellenőrzési státusz:** a matematikai képletek és tanári forráspéldák alapján ellenőrizve; a MATLAB-kódokhoz automatizált run_tests.m készült, de a jelen környezetben nem állt rendelkezésre futtatható MATLAB/Octave, így **valódi MATLAB-futtatási tesztet nem állítok**. Az első helyi indításkor futtasd a teszteket és a 14 példát.

## Strukturális térkép
~~~text
elmelet/        16 tétel, képletlap, papíros feladatok, visszakérdezés, plusz 2026-os anyag
matlab/common/  újrafelhasználható MATLAB-függvények
matlab/demo_*.m szintetikus feladatok
matlab/peldatar/ valódi Moodle-feladatokra írt megoldások
matlab/run_tests.m alapellenőrzések
vizsga/         időkeret, pontozás, próbavizsga, tanulási terv
~~~

Ha egy feladatot csak a script futtatásával tudok megoldani, de nem tudom elmagyarázni a képletet, az még nincs kész. **Cél: önálló megoldás és hibátlan indoklás.**
