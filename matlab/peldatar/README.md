# Megoldott feladatok és saját gyakorlóvariánsok

**Eredeti** = a csatolt tanári PDF / Moodle-minta alapján önállóan írt MATLAB-kód. **Saját** = a tananyagból megalkotott, nem igazolt korábbi vizsgafeladat.

A könnyen tanulható levezetések külön fájlokban:
- MEGOLDASOK_01_GEOMETRIA.md
- MEGOLDASOK_02_REGRESSZIO.md
- MEGOLDASOK_03_IDOJELEK.md
- MEGOLDASOK_04_FREKVENCIATER.md
- MEGOLDASOK_05_KIEGESZITOK.md

| Script | Kért adatfájl | Típus / eredet |
|---|---|---|
| 01_teglatest.m | teglatest1.mat | eredeti gyakorlo_peldak/feladat1 |
| 02_korkup.m | korkup1.mat | eredeti feladat2 |
| 03_rezges.m | rezges5.mat | eredeti feladat3 |
| 04_visszhang_szikla.m | hang_jelek.mat | eredeti feladat4 |
| 05_fuvola.m | fuvola8.wav | eredeti feladat5 |
| 06_barometer.m | barometer.mat | eredeti feladat6 |
| 07_szferoid.m | szferoid1.mat | eredeti vizsgaminta |
| 08_baba.m | baba1.mat | eredeti vizsgaminta |
| 09_radioaktiv.m | rad_bomlas.mat | eredeti feladat PDF |
| 10_cso.m | cso_adatok.mat | eredeti feladat PDF |
| 11_szonar.m | hang_jelek1.mat | eredeti vizsgapélda |
| 12_motorhang.m | motorhang.mat | 5. konzultáció |
| 13_gitar.m | guitar_A.wav | 5. konzultáció |
| 14_egyeniranyito_sablon.m | egyeniranyito.mat | eredeti feladatszöveg, **adat hiányzik**, ezért a fájl csak sablon |
| 15_csapagygolyo.m | csapagygolyo_atmero.mat | eredeti feladatszöveg, **adat hiányzik** |
| 16_egyeniranyito_szimulacio.m | nincs – saját adatok | **saját szintetikus** egyenirányító |
| 17_inga.m | belső számsor | 1. konzultációs példa |
| 18_napfolt_acf.m | havi_napfolt.csv | 4. konzultáció |
| 19_nemstacionarius_demo.m | non_stat_signal.mat opcionális | 4. konzultáció; fájl nélkül szintetikus |
| 20_villanymotor_hatasfok.m | villanymotor.mat | extra konzultáció |
| 21_ket_szenzor_kalibracio.m | nincs – saját adatok | saját tematikai variáns |
| 22_egyenletes_es_poisson_feladat.m | nincs – saját adatok | elméleti tételsorból vett saját számpéldák |

További demók: demo_01…demo_21 (egyes számoknál hiány lehet, a tényleges fájlokat nézd). Minden adatérzékeny scriptnél az egység és a változónevek a feltöltött forrás szerint vannak jelölve.

**Adatcsomag:** a Moodle-on talált 14 MAT/WAV fájlból készült külön felhasználói ZIP. A nyilvános repóba nem töltöttem fel a tanári fájlokat. A napfolt CSV és a non_stat_signal MAT a nagy eredeti archívumban találhatók, de a külön adatcsomagban nem szerepeltek.

**Valós tanári anyagban feltárt csapdák:**
1. Barométer: 3 nem pozitív p, log előtt ki kell zárni és indokolni.
2. Sziklafal: több zajos CCF-csúcs; vak absmax nem elég.
3. Szonár: 81 pontos CCF-simítással kb. 1296 m.
4. Szferoid: a számolt sűrűség fizikailag furcsa a „márvány” leíráshoz képest.
5. Cső: 4σ-küszöbön lévő adat és a tanári értelmezés eltérhet.

**Futtatás:** a matlab könyvtárban setup, a megfelelő adatfájl Current Folderbe másolása után run('peldatar/09_radioaktiv.m') stb. A scriptet módosítás nélkül más adatokra átvenni csak akkor szabad, ha a fizikai modell, mintavétel és változónevek egyeznek.
