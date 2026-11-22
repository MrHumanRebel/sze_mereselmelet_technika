# Teljesen levezetett MATLAB-vizsgafeladatok III. – idősorok, rezgés, szikla, szonár

## A. Rezgő rakomány – eredeti 3. feladat

**Forrás:** rezges5.mat / jel, 491 minta; a tanári szöveg szerint 0.1 s időköz, vagyis fs=10 Hz.

**Mit keresek?** Harmonikus kitérés periódusidejét T és amplitúdóját A, először szemrevételezve és SG-szűréssel, aztán FFT-vel.

**1. Időtengely:** t=(0:490)/10. Időtartam ~49.1 s, Nyquist=5 Hz, Δf=10/491≈0.02037 Hz.
**2. Nyerstábla:** plot(t,jel). Látom, hogy sok a zaj, ezért óvatos detrend/SG használható.
**3. SG:** 11 pontos ablak, 3. fok; lokálisan 3. fokú polinomot illeszt és a középpontban becsül. Ha 30 pontos ablakot próbálnék, a rövid csúcsokat eltüntethetném.
**4. Időtartományos T:** a helyesen paraméterezett csúcsok közti idők mediánja. Ha a megtalált csúcsok 0.1 s távolságra vannak, nyilván zajt találtam, nem a valódi periódust.
**5. Időtartományos A:** egy ciklus max/min különbségének fele, több cikluson medián/átlag. A jel DC/trend értékét ne tekintsem amplitúdónak.
**6. FFT:** [f,A]=one_sided_fft(jel,10), DC kivételével legnagyobb fizikai spektrális csúcs. A valós adaton a nyers detrendelt FFT egyik domináns binje ~0.4481 Hz. Periódus ~2.232 s. A bin-csúcs amplitúdója spektrális szivárgás miatt nem feltétlenül a pontos fizikai amplitúdó.
**7. Kontroll:** a két módszer frekvenciájának nagyságrendileg egyeznie kell; a felbontás, ablak és zaj számít.
Script: 03_rezges.m.

## B. Sziklafal – eredeti 4. feladat

**Forrás:** hang_jelek.mat, jel_1/jel_2/time, fs=1000 Hz, hangsebesség v=340 m/s. Egy hangimpulzus kimegy, visszaverődik, és visszaér.

**1.** Mindkét nyers jelt ugyanazon időtengelyen és külön ábrán ellenőrzöm. **2.** A közép/trend levonása indokolható. **3.** Keresztkorreláció: a tanári tanács szerint a korrelációs görbe simítása segíthet. **4.** A CCF különböző lokális csúcsait és előjelét is megnézem. **5.** A késés |lag|/1000 másodperc. A távolság **d=340·|lag|/(2·1000)** méter. **6.** A csúcspozíció bizonytalanságát (mintában) fizikai indokkal adom meg, és d-re propagálom.

**Fontos buktató a konkrét adaton:** a naiv abszolút simított CCF-maximum az egyik automatikus kiértékelésben |lag|≈1053 mintánál jelentkezett, d≈179.01 m. Van közeli, eltérő előjelű jelentős csúcs is; emiatt a **szemrevételezés és jelfizikai értelmezés kötelező**, nem tekintjük az automatikus absmax-ot hiteles igazságnak. A saját echo_peak_candidates.m több lehetséges csúcsot ad ki.

## C. Tengeralattjáró – valódi korábbi vizsgafeladat

**Forrás:** hang_jelek1.mat; fs=22000 Hz; a vízbeli hangsebesség 1500 m/s.
A tanári megoldás jel_1 és jel_2 között számolt keresztkorrelációt, majd 81 mintán simított korrelációt mutat.

**1.** N=50000 mindkét csatornán, Δt=1/22000 s.
**2.** Detrend mindkét jelre.
**3.** FFT-alapú CCF a teljes késésrácsra, a simítóablak 81 (a tanári kóddal egyezik).
**4.** A legjelentősebb hasznos esemény |lag|≈38012 minta körül van; Δt≈1.728 s.
**5.** Oda-vissza: d=(1500×38012)/(2×22000)≈1295.86 m.
**6.** A tanári PDF kommentje szerint (1296±10) m. Ez az ábráról becsült jelenségtartomány; ha standard bizonytalanságot kérnek, a választott modell alapján külön számolni kell.

**Miért FFT-alapú korreláció?** A naiv kétszeres ciklusos implementáció nagy N-re drága; a diszkrét konvolúció FFT-vel O(N log N), de a sorrendet és a nulla-késés indexét gondosan kell kezelni. Script: 11_szonar.m.

## D. Periodicitás autokorrelációval – napfoltok és szintetikus rezgés

Az ACF a jel és eltolt önmaga hasonlóságát méri. Lag=0 nem a keresett periódusidő, hanem triviális ön-egyezés. Periodikus jel esetén a **következő pozitív késésű maximumok** közötti távolság közel T.
A tanári havi_napfolt.csv adathoz a 4. oszlop tartozik, a saját oktatói script 1900-tól kezdi. Napfoltciklushoz több évnyi megfigyelés és széles ACF-késés ablak kell.
Scriptek: 18_napfolt_acf.m, demo_17_acf_periodus.m.

## E. Nemstacionárius jel és simítás

A nemstacionárius jel statisztikai jellemzői időfüggők. Ha lassú trend ráül a hasznos jelre, a korrelációs függvény az eredeti és a detrendelt adatokon nagyon eltérhet.
A tanári non_stat_signal.mat a 4. konzultációval érkezik, a saját 19_nemstacionarius_demo.m az eredeti fájlt használja, ha jelen van, különben **SZINTETIKUS** jelzéssel saját mintát generál.

## Visszhang vizsgaellenőrzés
Kettővel osztottam? Megfelelő fs? Lag=minta vagy másodperc? A jel-fizikai eseményt választottam, nem vakon a legnagyobb csúcsot? A bizonytalanságot standardnak vagy tartománynak nevezem? Ábrán látszik a keresett csúcs?
