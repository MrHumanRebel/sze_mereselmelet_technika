# Nulláról a vizsgáig – sorrend

A cél nem az, hogy bemagoljak 200 képletet. Az a cél, hogy ránézzek egy feladatra, és tudjam: mit mértek, mi a kérdés, milyen képlet kell, milyen MATLAB-parancs kell, hogyan ellenőrzöm az eredményt.

## Tanulási útvonal
1. **Alapok:** mértékegység, mérési hiba, átlag és szórás. Tanuld: 01–03. tétel és MATLAB/01.
2. **Valószínűség és statisztika:** eloszlások, átlag becslése, átlag bizonytalansága. Tanuld: 04–09. tétel és MATLAB/02.
3. **Hibaterjedés:** sűrűség, térfogat, tömeg. Tanuld: 10. tétel; oldd meg a téglatest/körkúp példákat.
4. **Regresszió és linearizálás:** egyenesillesztés, exponenciális és barométer. Tanuld: 11–12. tétel.
5. **Jelek időtartományban:** trend, zaj, mozgóátlag, Savitzky–Golay, korreláció. Tanuld: 13–14. tétel.
6. **Jelek frekvenciatartományban:** mintavételezés, FFT, spektrum. Tanuld: 15–16. tétel.
7. **Vizsgaszimuláció:** időre, internet nélkül, először 120 perc MATLAB, majd 30 perc írásbeli.

## Minden írásbeli tételre ugyanaz a sablon
**Definíció** → **fő képlet** (jelölésekkel és mértékegységekkel) → **mire jó** → **egy érthető példa** → **tipikus hiba**. Egy 30 perces válaszban ne csak képlet szerepeljen: mondd el szavakkal az összefüggést.

## MATLAB minden megoldásra
1. Betöltés után: whos, size, min, max, plot.
2. Durva hibák ellenőrzése és indokolt kezelése, mindig újraellenőrizve.
3. Mértékegység és sor/oszlop alak rendbetétele.
4. Módszer kiválasztása és ábrázolás.
5. Eredmény ÉS bizonytalanság ÉS egység.
6. Sanity check: pozitív-e a tömeg/térfogat? reális-e a frekvencia? van-e időeltolás?
7. Futó m-fájl, nem csak munkaterületen maradt változók.

## Lényeges vizsgaszabály
A 2024.09.02-i **vizsgarend_lev_meres.pdf** szerint MATLAB 120 perc és írásbeli 30 perc, mindkét részen minimum 40%, és átlagban minimum 50%. A 2026/27-es tantárgytematika írásbeli és szóbeli vizsgát említ; a tényleges aktuális részleteket a vizsgáztatóval érdemes ellenőrizni. Az itt leírtak a feltöltött Moodle-anyagból származnak.

**Saját szabály:** amit nem tudok elmagyarázni 2 mondatban, azt még nem tudom.
