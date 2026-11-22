# Mérési adatok

A Moodle-ból származó mérési adatok a \`matlab/adatok/\` mappában vannak. A gyors MATLAB-indításhoz a fontos bemeneti fájlok a \`matlab/\` gyökérbe is be vannak kötve, így az egyetemi vizsgaszkriptek szokásos \`load('...mat')\` és \`audioread('...wav')\` hívásai közvetlenül működnek. A két helyen tárolt fájlok Git-blob SHA-ja ugyanaz: nem két eltérő mérési adatsor.

A feldolgozók a MATLAB \`matlab/\` mappájából futtatandók, először \`setup\`, majd \`run_tests\`, \`run_extended_tests\`, \`run_source_data_tests\`. A szerzői MATLAB-kódok a \`forrasok/moodle/\` mappastruktúrában is elérhetők.
