# Méréselmélet és -technika — 13–16. tétel

## 13. Időjelek, korreláció, repülési idő

Az időjel x(t), digitalizálva x[n]. A minták egymástól időben függhetnek: lehet lassú trend, periodikus rezgés vagy valamilyen eseményhez tartozó impulzus.

**Autokorreláció** esetén a jelet saját eltolt példányával hasonlítom össze. Az ismétlődő maximumokból periodicitás becsülhető. **Keresztkorreláció** esetén két különböző jel közös mintázatának időbeli eltolását keresem. A MATLAB xcorr-függvényének lag változója általában **mintaszám**, nem másodperc.

> **Δt=|lag|/fₛ. Visszhangnál: d=vΔt/2. Egyirányú terjedésnél: d=vΔt.**

**Számpélda:** fs=22 000 Hz, az impulzus-visszhang késése 38 012 minta, a hangsebesség 1500 m/s. Δt≈1,728 s; d≈1295,9 m.

**Amire figyelek:** a korreláció eltolásának előjele a jelpár sorrendjétől függ. Zajos adatoknál a globális legnagyobb csúcs nem mindig a fizikai eseményhez tartozik. Az eredeti és a korrelációs jelgrafikont együtt ellenőrzöm.

**MATLAB:** echo_delay_local.m, echo_peak_candidates.m, peldatar/11_szonar.m.

## 14. Trendek, simítás és Savitzky–Golay

A nyers időjelben lehet hasznos komponens, eltolás, lassú trend, zaj és tranziens. A **detrend** a trendet távolítja el; az **átlag levonása** csak a DC-összetevőt. A **simítás** a gyors ingadozást csökkenti, de a hasznos jel bizonyos részét is módosíthatja.

A mozgóátlag az egymás melletti minták átlagát veszi; egyszerű és gyors, de a csúcsokat ellapíthatja. A Savitzky–Golay egy csúszó ablakon belül polinomot illeszt; megfelelő beállításnál a csúcsok alakját jobban megtartja.

> **SG-feltétel:** az ablak páratlan hosszú, és a polinomfok kisebb az ablak hosszánál.

**Számpélda:** egy 10 Hz mintavételezésű, zajos rezgésen 11 mintás, harmadfokú SG-t próbálok. A kapott görbét az eredetivel összevetem, a csúcsok közti T periódusidőt külön ellenőrzöm.

**Amire figyelek:** ha az ablak túl nagy, a fizikai csúcs eltűnhet. A 0 késésű autokorrelációs maximum nem periódusbecslés.

**MATLAB:** sgolay_local.m, local_peaks.m, peldatar/03_rezges.m, 18_napfolt_acf.m.

## 15. Frekvenciatartomány, mintavételezés, Fourier-analízis

A Fourier-analízis a jelet különböző frekvenciájú összetevőkre bontja. A DFT diszkrét mintákra alkalmazott transzformáció; az FFT ennek gyors kiszámítása.

Ha a mintavételi frekvencia fs, a Nyquist-határ fs/2. A frekvenciarács távolsága Δf=fs/N, ahol N a mintaszám. A mintavételi tétel szerint ideálisan sávkorlátozott jel visszaállításához fs>2fmax szükséges. A Nyquist fölötti komponensek aliasingot okozhatnak.

> **Nyquist:** fN=fs/2. **FFT rács:** Δf=fs/N. **Egyoldali belső bin:** A[k]=2|FFT(x)[k]|/N.

A valós jel FFT-jének egyoldali amplitúdóspektrumában a DC-t nem duplázom, és páros N-nél a Nyquist-pontot sem.

**Számpélda:** fs=1000 Hz és N=2000. A Nyquist-határ 500 Hz, a felbontás Δf=0,5 Hz, a megfigyelés 2 s. Ha 700 Hz-es jelet mintavételezek 1000 Hz-cel, az 300 Hz-es aliasnak látszhat.

**Amire figyelek:** a frekvenciatengely nem az FFT tömb indexe. A nulla-kitöltés nem javítja a tényleges frekvenciafeloldást. Spektrális szivárgásnál az FFT csúcsa nem feltétlen a pontos fizikai amplitúdó.

**MATLAB:** one_sided_fft.m, demo_07_spektralis_szivargas.m, demo_14_aliasing.m, peldatar/05_fuvola.m.

## 16. Auto- és keresztspektrum, Nyquist, frekvenciafelbontás

Az amplitúdóspektrum a szinuszos komponensek amplitúdóját adja. A **PSD** a jel teljesítményét / varianciáját frekvencia szerint osztja fel; az egysége a jel egységének négyzete per Hz.

**Autospektrum:** Pxx, egyetlen jel frekvencia szerinti teljesítménysűrűsége. **Keresztspektrum:** Pxy, két jel közös frekvenciás összefüggéseit, többek közt fázisviszonyát mutatja. Az abszolútérték-négyzetes koherencia a két jel frekvenciafüggő összefüggését 0–1 skálán írja le.

> **Cxy(f)=|Pxy(f)|²/[Pxx(f)Pyy(f)].**

A **Welch-módszer** a jelet több (sokszor átfedő) szegmensre bontja, ablakolja, és a szegmensenként számolt periodogramokat átlagolja. Ezzel a becsült spektrum kevésbé zajos lesz. Egyetlen FFT-párból képzett „koherencia” triviálisan 1 lehet; szegmensátlagolás szükséges.

**Számpélda:** két mikrofon ugyanazt a 200 Hz-es jelet méri. Mindkettő PSD-jében jelentkezhet 200 Hz-es csúcs, a keresztspektrumban közös komponens, a koherenciában pedig magas érték.

**Amire figyelek:** PSD és amplitúdóspektrum nem ugyanaz. Nyquist=fs/2, frekvenciafelbontás=fs/N, és a teljesítménysűrűség egysége jel²/Hz.

**MATLAB:** spectra_welch_local.m, demo_05_fft_korrelacio.m.
