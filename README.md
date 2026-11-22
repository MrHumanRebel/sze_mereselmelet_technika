# Méréselmélet és -technika (GKLM_FKTM013)

**Széchenyi István Egyetem · 2026/27/1**

A tárgy elméleti tételei, számolási feladatai és MATLAB-megoldásai egy helyen. A feladatokat a Moodle-on kapott példák alapján rendeztem; ahol nincs meg az eredeti mérési adat, azt külön jelöltem, és saját gyakorlóadattal helyettesítettem.

## Tananyag

| Anyag | Tartalom |
|---|---|
| [Elméleti jegyzet – PDF és HTML](kiadvany/) | 16 vizsgatétel, képletek, számpéldák, összefoglalók |
| [Képletlap – PDF](kiadvany/Mereselmelet_es_technika_GKLM_FKTM013_Kepletlap.pdf) | Nyomtatható összefüggésgyűjtemény |
| [1–6. tétel](elmelet/01_06_meres_es_eloszlasok.md) | Mérési alapok, bizonytalanság, eloszlások |
| [7–12. tétel](elmelet/07_12_statisztika_regresszio.md) | Becslés, hibaterjedés, regresszió |
| [13–16. tétel](elmelet/13_16_idojel_fft.md) | Időjelek, simítás, FFT, spektrumok |
| [Képletek](elmelet/KEPLETLAP.md) | A legfontosabb összefüggések |
| [Papíros feladatok](elmelet/PAPIROS_FELADATOK.md) | Lépésenként levezetett számpéldák |
| [Vizsgafeladat-katalógus](vizsga/04_TELJES_FELADATKATALOGUS.md) | 30 azonosított feladattípus; forrás és saját variáns jelölve |
| [MATLAB-feladattár](matlab/peldatar/) | Konkrét Moodle-példák és saját tesztfeladatok |
| [Részletes feladatlevezetések](matlab/peldatar/MEGOLDASOK_01_GEOMETRIA.md) | Geometria, regresszió, időjelek, frekvenciatér, kiegészítők |
| [Próbavizsgák](vizsga/02_PROBAVIZSGAK.md) | Önálló feladatlapok és ellenőrző kérdések |

## MATLAB – indítás

A Current Folder legyen a repository \`matlab\` könyvtára.

\`\`\`matlab
setup
run_tests
run_extended_tests
run_source_data_tests
run('demo_01_statisztika.m')
run('peldatar/09_radioaktiv.m')
\`\`\`

Néhány eredeti MAT fájl már benne van a repóban a [matlab/adatok](matlab/adatok/) mappában (baba, barométer, kúp, szferoid). A további forrásadatos példákhoz az eredeti MAT/WAV állományok szükségesek. Az adatok változóneveit és az adott feladat mérési egységeit a \`matlab/peldatar/README.md\` tartalmazza. A tesztfuttatások a GitHub [Actions](../../actions) alatt is követhetők.

## Vizsga

A feltöltött, **2024. szeptember 2-i vizsgarend** 120 perces számítógépes MATLAB-feladatot és 30 perces írásbeli elméleti részt ír elő; mindkettőn legalább 40%-ot kell teljesíteni, az összesített eredménynek legalább 50%-nak kell lennie. A **2026/27-es tematika** írásbeli és szóbeli vizsgát említ. A tényleges lebonyolítást az aktuális tájékoztató alapján kell ellenőrizni.

## Fájlok és verziók

- \`kiadvany/\`: nyomtatható PDF, offline HTML és a kiadvány előállításához használt forrás.
- \`elmelet/\`: szerkeszthető elméleti jegyzet és példák.
- \`matlab/common/\`: segédfüggvények.
- \`matlab/peldatar/\`: feladatmegoldások.
- \`vizsga/\`: feladatkatalógus, vizsgarend, tanulási terv.

A repository fejlesztési ága: **main**.

A külső források licencállapotát és az adatfájlok elérhetőségét a [forrásjegyzék](FORRASOK_ES_LEFEDETSEG.md) tartalmazza. Egy fájl nyilvános elérhetősége önmagában nem jelent szabad újraterjesztési engedélyt.
