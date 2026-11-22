# MATLAB tesztelés: mi ellenőrzött és mi nem?

## 1. Alap szintetikus tesztek
A matlab mappában indítsd:
- setup
- run_tests
- run_extended_tests

Ezek kézzel ismert eredményeken tesztelik az átlag/szórást, iteratív 3σ szűrést, regressziót, helyes egyoldali FFT-t, visszhang-távolságot, SG-t, PSD/koherenciát, autokorrelációt, szinuszillesztést, súlyozott LK-t, motor-mediánokat, MAD-et és Jacobian-t.

## 2. Valós Moodle-adatos tesztek
Az eredeti MAT-fájlok már a repository `matlab/` munkamappájában vannak. Futtasd:
- run_source_data_tests

Ellenőrző pontok: radioaktív T≈7099.6 s, barométer 3 p<=0 és p0≈961.83 forrásegység, szonár kb. 1296 m, a motormátrix 3 oszlopos.

**Figyelem:** [SKIP] azt jelenti, hogy nem futott teszt, nem azt, hogy sikeresen lement. Ha teljes forrástesztre törekszünk, semmilyen [SKIP] nem maradhat.

## 3. Környezeti státusz
A kódok MATLAB-ra készültek. A GitHub Actions GNU Octave alatt futtatja az automatizált ellenőrzéseket. Ez **nem helyettesíti az egyetemi MATLAB-ban történő végső ellenőrzést**. A forrásadatok Python/NumPy/SciPy-vel olvashatók voltak és több konkrét mintaérték ellenőrizhető, de ez önmagában nem MATLAB-kompatibilitási bizonyíték.

## 4. Milyen hibát keressek?
A MATLAB Current Folder a matlab könyvtár legyen, a MAT/WAV fájlok pedig ugyanitt legyenek. A run_tests szükség esetén addpath-ot állít. Az eltérő MATLAB verziókhoz tartozó figure/histogram/yline/readmatrix függvények támogatását az adott laborgépen is ellenőrizni kell.
