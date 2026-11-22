# Minőségellenőrzés, korlátok, validálás

## Matematikailag ellenőrizhető kontrollértékek
- 9,10,11,10 → átlag 10, std √(2/3), közép SEM std/2.
- fs=1000, N=1000, 3*sin(2π50t) → FFT csúcs 50 Hz és 3 amplitúdó.
- Visszhang: 20 minta 1000 Hz-en, 340 m/s → 3.4 m.
- Radioaktív minta a feltöltött tanári PDF szerint: T≈7099.6 s.
- Cső példa a tanári PDF szerint: m≈0.94 kg; Ix≈9.85·10⁻⁴ és Iz≈4.01·10⁻⁴ kg·m².
- Szónár tanári vizsga: kb. 1296 m (81 ponton simított CCF), nyers absmax nem jó.

## Futási sorrend
1. MATLAB: matlab/setup.m.
2. MATLAB: matlab/run_tests.m – minden PASS.
3. demo_01…demo_12, mindegyik ábráját ellenőrizd.
4. A saját Moodle-adatcsomagot tedd a Current Folderbe.
5. peldatar/01…peldatar/13; a 14-es sablon csak akkor futtatható, ha az adata és a változónevek rendelkezésre állnak.
6. Eredmények egységét és a tanári referenciaértékeket hasonlítsd össze.
7. Frissítsd az ellenőrzési státuszt, ha tényleges MATLAB/Octave teszt lefutott.

## Mi nincs igazolva?
A repó szerzői környezetében **nem volt telepítve MATLAB vagy GNU Octave**. Ezért a kódok statikus/analitikus ellenőrzése nem egyenértékű a tényleges MATLAB-rendszerben történő futtatással. Ezt nem rejtem el.

## Metrológiai megjegyzés
A outlier szűrő 3σ/4σ algoritmus demonstráció és az oktatói módszer operacionalizálása, nem GUM szerinti automatikus érvényesség-vizsgálat. A kontrollált elvetéshez vizuális és fizikai indokolás kell. A rövid, zajos időjelek csúcshelyének bizonytalanságát a jel/zaj viszony, simító paraméterek és mintavételi felbontás befolyásolja; pusztán a simítóablakból kapott intervallum nem bizonyított standard bizonytalanság.
