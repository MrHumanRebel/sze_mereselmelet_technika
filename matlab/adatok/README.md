# MATLAB mérési adatfájlok

A Moodle-anyagokból gyűjtött **30 bemenet** (14 MAT, 3 WAV, 2 CSV, 4 Excel és 7 DAT) eredeti bájttartalommal került a repóba. A teljes, az eredeti forrásmappákhoz rendelt SHA-256 jegyzék: [FORRAS_MANIFEST.json](../../FORRAS_MANIFEST.json).

A fájlok a `matlab/` gyökérben is szerepelnek, így az eredeti és a saját megoldások nem igényelnek külön fájlmásolást.

**Futtatás:**

```matlab
setup
run_tests
run_extended_tests
run_source_data_tests
run('peldatar/09_radioaktiv.m')
run('peldatar/11_szonar.m')
```

A MATLAB Current Folder legyen a repository `matlab/` mappája. A `setup` emellett az `adatok/`, `common/` és `peldatar/` elérési útvonalakat is beállítja.

A teljes Moodle-beli eredeti mappaszerkezet a [forrasok/moodle](../../forrasok/moodle/) alatt található. Két hiányzó eredeti bemenetet (`csapagygolyo_atmero.mat`, `egyeniranyito.mat`) az archívum nem tartalmazott; ezekhez külön, egyértelműen jelölt szintetikus példa készült.
