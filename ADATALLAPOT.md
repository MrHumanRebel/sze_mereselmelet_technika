# Adat- és forrásállapot

**Feltöltés kész — main.** A 32 736 565 bájtos importcsomag GitHub Actions segítségével SHA-256 ellenőrzés után került kibontásra. Az eredeti, 179 forrásfájlból **178** található a nyilvános repóban; egy kifejezett újraközlési tilalmat tartalmazó MathWorks-kézikönyv kimaradt.

| Állománycsoport | Jelenlegi szám |
|---|---:|
| Eredeti kibontott Moodle-fájlok | 159 |
| Külön Moodle-alapanyagok | 19 |
| MATLAB-bemenetek a \`matlab/adatok/\` mappában | 30 |
| WAV-bemenetek az adatok mappában | 3 |
| MAT-bemenetek az adatok mappában | 14 |
| CSV-bemenetek az adatok mappában | 2 |
| Excel-bemenetek az adatok mappában | 4 |

A 30 bemenet a MATLAB-munkamappában (\`matlab/\`) is megtalálható, ezért nem kell manuálisan másolgatni a fájlokat. A két másolat Git-blobazonosítója egyezik.

**A forráscsomagból eredetileg is hiányzik:** \`csapagygolyo_atmero.mat\`, \`egyeniranyito.mat\`. Az ezekhez adott szintetikus demók nem eredeti mért adatok.

**Egyetlen tudatosan kihagyott PDF:** \`info2/info2/UsingMatlab.pdf\`, a gyártói újraközlési korlátozás miatt.

Tételes eredet, méret és SHA-256: [FORRAS_MANIFEST.json](FORRAS_MANIFEST.json).
