# Vizsgastratégia – két részt külön kell megugrani

**Forrás:** vizsgarend_lev_meres.pdf (feltöltött 2024-es dokumentum), elmeleti_kerdesek_vizsgahoz.pdf (16 tétel), vizsga_jotanacsok.txt, 2026/27-es tárgytematika.

## 120 perc MATLAB
- **0–10 perc:** olvasd el a teljes feladatsort, írd fel az adatfájl nevét, egységeket, mintavételi frekvenciát, származtatott mennyiségek képletét.
- **10–25 perc:** load, whos, méretek, előzetes ábra, durva hibák ellenőrzése, indokolt szűrés.
- **25–75 perc:** fizikai modell vagy illesztés, fő számolás, közbenső ellenőrzések.
- **75–100 perc:** bizonytalanságok, mértékegységek, eredmények és kommentek.
- **100–115 perc:** teljes script újraindítása tiszta workspace-ből, ábrák és értékek ellenőrzése.
- **115–120 perc:** az oktató által kért névvel és helyre elkészített mappa, minden .m + szükséges adat + dokumentáció.

## 30 perc írásbeli
- **0–3 perc:** a tétel gerince: definíciók, jelölések.
- **3–15 perc:** képletek, levezetés, magyarázat.
- **15–25 perc:** saját példa, ábra, tipikus korlátok.
- **25–30 perc:** mértékegységek és olvashatóság ellenőrzése.

## Pontozás a feltöltött vizsgarend szerint
Külön MATLAB ≥40%, elmélet ≥40%. Két százalék átlaga: 0–49% 1; 50–59% 2; 60–74% 3; 75–84% 4; 85–100% 5.
Például 90% MATLAB + 20% elmélet nem elég, mert a 20% részminimum alatti.

## A tanár konkrét hibajegyzéke
1. Ellenőrizzem a durva hibákat minden releváns bemeneti adatsorban, ne csak mondjam, hogy vannak.
2. A törlés után futtassam újra az ellenőrzést.
3. Hibaterjedéshez lehetőleg analitikus deriváltat használjak.
4. Nemlineáris modellnél linearizálás → lineáris paraméterek és szórásuk → visszaalakítás → fizikai paraméterek szórása.
5. FFT mellé **mindig helyes frekvenciatengely**.
6. Trend és zaj ellen detrend/simítás; mindig nézzem meg előtte-utána.
7. findpeaks paraméterezését ellenőrizzem; ne mutasson irreálisan sok csúcsot.
8. xcorr késéstengelye nem közvetlen idő.

## Fontos
A vizsgán korlátozott az internet, de az oktatói vizsgarend szerint Moodle segédletek elérhetőek lesznek. Ne arra építsek, hogy a saját GitHub-fiókom elérhető lesz! Az elméletet gyakoroljam önállóan, a kódot pedig tudjam újraírni.

A 2026/27-es tantárgytematika és a régebbi vizsgarend megfogalmazása nem teljesen egyezik. Ez felkészítő segédlet, nem az aktuális intézményi vizsgarend hitelesítése.
