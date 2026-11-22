# Méréselmélet és -technika – FULL VIZSGA GRIND

**Széchenyi István Egyetem · GKLM_FKTM013 · 2026/27/1 · levelező**

Na tesó, ez a repó egyetlen célra van: **nulláról felkészülni az elméleti és MATLAB-vizsgára úgy, hogy tényleg értsem is a feladatokat**. Nem csak képleteket másolok: feladatszöveg → matematika → működő script → standard bizonytalanság → ábra → értelmes eredmény.

**Minden fejlesztés közvetlenül a main ágra megy.** Az első PR már beolvasztva, a további kódok is main commitok.

## Első kattintások
- **[TELJES 30 feladattípusos katalógus](vizsga/04_TELJES_FELADATKATALOGUS.md)** – melyik feladatra milyen módszer kell. A tényleges Moodle-feladatok, tematikai elemek és saját bővítések jelölve.
- **[Tényleges Moodle-feladatok: geometria](matlab/peldatar/MEGOLDASOK_01_GEOMETRIA.md)** – téglatest, kúp, szferoid, gömb, cső.
- **[Tényleges Moodle-feladatok: regresszió](matlab/peldatar/MEGOLDASOK_02_REGRESSZIO.md)** – radioaktív, barométer, baba.
- **[Tényleges Moodle-feladatok: időjelek](matlab/peldatar/MEGOLDASOK_03_IDOJELEK.md)** – rezgés, szikla, szonár, ACF.
- **[Tényleges Moodle-feladatok: frekvenciatér](matlab/peldatar/MEGOLDASOK_04_FREKVENCIATER.md)** – fuvola, gitár, motorhang, egyenirányító, FFT.
- **[Tényleges Moodle-feladatok: extra](matlab/peldatar/MEGOLDASOK_05_KIEGESZITOK.md)** – villanymotor hatásfokmező, ADC, kalibrálás, CI.
- **[MATLAB feladattár és forrásnevek](matlab/peldatar/README.md)** – az egyes .m fájlokhoz melyik .mat/.wav kell.
- **[MATLAB nulláról](matlab/00_KEZDES.md)** és **[MATLAB döntési fa](matlab/VIZSGA_RECEPT.md)**.
- **[Tesztelési és CI-leírás](matlab/README_TESZTELES.md)**.

## Elméleti rész
- [Tanulási sorrend](elmelet/00_HOGYAN_TANULJAM.md)
- [1–6. tétel](elmelet/01_06_meres_es_eloszlasok.md)
- [7–12. tétel](elmelet/07_12_statisztika_regresszio.md)
- [13–16. tétel](elmelet/13_16_idojel_fft.md)
- [Plusz 2026-os tematika](elmelet/17_KIEGESZITO_2026_TEMATIKA.md)
- [Képletlap](elmelet/KEPLETLAP.md), [papíros példák](elmelet/PAPIROS_FELADATOK.md), [40 visszakérdező](elmelet/AKTIV_FELIDEZES.md)

## Vizsga
- [Felkészülési terv 7 napra](vizsga/03_7_NAPOS_TERV.md), [próbavizsgák](vizsga/02_PROBAVIZSGAK.md), [stratégia, pontozás](vizsga/01_STRATEGIA_ES_PONTOZAS.md).
- A feltöltött **2024-es vizsgarend szerint** MATLAB 120 perc + írásbeli elmélet 30 perc, külön-külön minimum 40%, végső eredmény átlag ≥50%.
- **Eltérő hivatalos dokumentum:** a 2026/27-es tantárgytematika írásbeli **és szóbeli** vizsgát említ. A tényleges aktuális lebonyolítást az oktatóval kell megerősíteni.

## Indítás MATLAB-ban
1. Csomagold ki a saját Moodle-MAT/WAV adatfájlokat a MATLAB Current Folderbe. A nyilvános repó nem tartalmaz szerzői jogilag nem tisztázott oktatói anyagokat.
2. MATLAB Current Folder = a repó matlab mappája.
3. Parancsablakban: **setup**.
4. Majd: **run_tests**, **run_extended_tests**; a tényleges Moodle-fájlokkal **run_source_data_tests**.
5. Demók: **run('demo_01_statisztika.m')** stb.
6. Feladat: **run('peldatar/09_radioaktiv.m')**, **run('peldatar/11_szonar.m')**.

## Amit fejből kell tudnom
- s=std(x) egyedi minta szórása; SEM=s/sqrt(n) az átlag becsült standard hibája független adatokra.
- Durva hiba előtt/után ellenőrzés, több oszlopnál összetartozó teljes sorok kezelése.
- Gauss-féle hibaterjedésnél analitikus gradiens, és ha kell, kovariancia.
- Regresszióból nem elég m,b, kell a paraméterhiba is.
- xcorr késését mintáról s-ra váltom, visszhang távolságát kettővel osztom.
- FFT-hez **helyes frekvenciatengely, helyes egyoldali normálás és Nyquist**.

## Forrás és felelősség
[Forrásaudit](FORRASOK_ES_LEFEDETSEG.md). A feltöltött anyag egy része régebbi szemeszterből származik, és két szöveges feladathoz (csapágygolyó, egyenirányító) az eredeti .mat fájl hiányzott. Ezekhez **külön jelölt szintetikus mintát** készítettem, nem kitalált oktatói mérési adatot.

**QA:** automatizált GNU Octave-kompatibilitási munkafolyamat van a GitHub Actions alatt. Ez nem egyenértékű a laborban futtatott MATLAB-lal. Az első CI-körben talált Welch-keresztspektrum összeadási hibát javítottam; a végső státuszt a GitHub Actions aktuális eredménye mutatja. A MATLAB-laborban külön futtatási ellenőrzés szükséges.

A cél nem az, hogy a kód valahogy kiadjon egy számot. A cél, hogy **minden sorát és minden eredményt el tudjak magyarázni a vizsgán.**
