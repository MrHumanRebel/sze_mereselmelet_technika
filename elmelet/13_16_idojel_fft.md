# 13–16. elméleti tétel – időjelek, simítás, FFT és spektrumok

## 13. Időjelek időtartományban, korreláció, repülési idő

**Vizsgaválasz:** Időjel bármely időben változó mennyiség: x(t) vagy mintavételezve x[n]. Vizsgáljuk középértékét, szórását, trendjét, periodicitását és időbeli összefüggéseit. Autokorreláció a jel és eltolt önmaga közötti kapcsolat: Rxx(τ)=E[x(t)x(t+τ)] (középérték-levonásos változata autokovariancia). Keresztkorreláció két jel közös mintázatának időeltolását mutatja: Rxy(τ). A maximumhoz tartozó késés repülési időből távolságot adhat. Egy visszavert impulzusnál oda-vissza út miatt **s = v·Δt/2**. A Δt = |lag|/fs, mert a MATLAB xcorr késése mintákban van.

**Példa:** fs=1000 Hz, a visszhang 200 mintával később jön, v=340 m/s → Δt=0.2 s → s=34 m.

**Ne keverd:** xcorr tengelyén alapból a késés **mintákban**, nem másodpercben van; az xcorr(x,y) késésének előjele argumentumsorrendtől függ. Ellenőrizd a jelek fizikai sorrendjét.

## 14. Trendek és simítás, Savitzky–Golay

**Vizsgaválasz:** Egy időjel leírható hasznos komponens + trend + zaj összegével. Trend lehet állandó szint, lineáris vagy lassú drift. A detrend tipikusan lineáris trendet von le; a mean(x) levonása csak DC-összetevőt távolít el. A mozgóátlag az egymás melletti minták átlagával simít; zajt csökkent, de a gyors változásokat és csúcsokat ellapítja. A Savitzky–Golay módszer csúszó ablakon belül alacsony fokú polinomot illeszt, és az ablak középpontjára becsült értékkel simít; a csúcsmagasság és csúcsalak sokszor jobban megmarad. Paraméterek: páratlan ablakméret, polinomfok < ablakméret.

**Példa:** zajos, szinuszos rezgés: detrend → Savitzky–Golay → csúcsok közötti időből periódusidő. T=1/f.

**Ne keverd:** túl nagy ablak kisimíthatja az igazi csúcsokat; előtte-utána ábrát mindig készíts.

## 15. Frekvenciatartomány, mintavételezés, Fourier-analízis

**Vizsgaválasz:** Fourier-analízissel egy jelet szinuszos összetevőkre bontunk. A diszkrét Fourier-transzformáció: X[k]=Σₙ₌₀ᴺ⁻¹ x[n]exp(−j2πkn/N). A MATLAB fft ezt gyorsan számítja. Mintavételi frekvencia fs=1/Δt. A Nyquist-frekvencia fN=fs/2. A mintavételezési tétel szerint egy fmax-nál nagyobb frekvenciát nem tartalmazó, sávkorlátozott jel egyértelmű visszaállításához fs>2fmax szükséges, a mintavételezés előtti anti-alias szűrés fontos. Ellenkező esetben átlapolódás (aliasing) történik.

**Példa:** fs=1000 Hz → fN=500 Hz; egy 700 Hz-es szinusz 300 Hz-nek látszhat.

**MATLAB:** Y=fft(x); N=length(x); df=fs/N; f=(0:floor(N/2))*df. Egyoldali amplitúdóspektrumnál 2·abs(Y)/N csak a nem-DC, nem-Nyquist pozitív frekvenciájú bin-ekre érvényes.

**Ne keverd:** a frekvenciafelbontás df=fs/N, nem fs/2. A zérókitöltés finomabb megjelenítési rácsot ad, de nem javítja a tényleges frekvenciafeloldó képességet.

## 16. Auto- és keresztspektrum, Nyquist-frekvencia, frekvenciafelbontás

**Vizsgaválasz:** Az autospektrum a jel teljesítményének/varianciájának frekvenciák szerinti megoszlását mutatja (PSD). A keresztspektrum két jel közötti frekvenciatartománybeli kapcsolatot, közös komponenseket és fázisviszonyt vizsgál. FFT-alapú periodogramnál – szokásos kétoldali PSD-konvencióban – Pxx[k]=|X[k]|²/(fs·N), Pxy[k]=conj(X[k])Y[k]/(fs·N); egyoldali PSD-nél a belső pozitív frekvenciájú pontokat duplázzuk. A PSD mértékegysége jel²/Hz. Szegmensek átlagolásával (Welch) zajos spektrumot simábbra becsülünk. Magnitúdó-négyzetes koherencia: Cxy(f)=|Pxy(f)|²/[Pxx(f)Pyy(f)] és 0–1 közötti, megfelelően átlagolt becslésnél.

**Példa:** két mikrofon közös 200 Hz-es jelet vesz → a keresztspektrumban 200 Hz körüli összefüggés, a fáziskülönbségből az időeltolás vizsgálható.

**Vizsgán fontos:** fs=2000 Hz, N=4000 → Nyquist = 1000 Hz, df=0.5 Hz, mérési idő 2 s. Egyetlen FFT alapján számolt nyers koherencia triviálisan 1 is lehet, ezért koherenciát általában több ablak átlagolásával érdemes számolni.

## Mit rajzoljak le?
- Időtartomány: t (s) – x(t) (mért egység), trend/simítás előtte-utána.
- Korreláció: késés (minta vagy s) – korreláció.
- FFT: frekvencia (Hz) – amplitúdó (mért egység), a csúcsok feliratozva.
- Spektrum: f (Hz) – PSD (jel²/Hz), értelmes tartományra nagyítva.

## Gyors, fejből tudandó képletek
- fs = 1/Δt; fN = fs/2; Δf = fs/N; T_megfigy = N/fs
- f = 1/T
- Δt = |lag|/fs
- echo: s = v·|lag|/(2fs)
- 1-oldali FFT belső bin: A[k] = 2|FFT(x)[k]|/N
