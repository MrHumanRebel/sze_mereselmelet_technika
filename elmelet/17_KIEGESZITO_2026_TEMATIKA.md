# Kiegészítő témák a 2026/27-es tematikából

A 16 tételes, külön PDF-ben kiadott elméleti listán túl a **2026_27_1_GKLM_FKTM013.pdf** néhány további témát is megnevez. Ezeket alacsonyabb prioritással, de ismerjem.

## Konfidenciaintervallum
Független, közel normális mintából ismeretlen szórással a várható érték kétoldali 1−α konfidenciaintervalluma: x̄ ± t_(1−α/2,n−1)·s/√n. Ez nem azt jelenti, hogy a már kiszámolt egyetlen intervallumban véletlenszerűen mozog a rögzített, ismeretlen paraméter; az eljárás hosszú távú lefedettségi aránya 1−α. Nagy mintára t helyett közel z is használható.

## Egyszerű hipotézisvizsgálat
H₀ nullhipotézis, H₁ alternatíva; α az I. fajú hiba megengedett valószínűsége. P-érték: a megfigyelt vagy annál szélsőségesebb eredmény valószínűsége H₀ fennállásakor. Nem H₀ igazságának valószínűsége. Egymintás t-statisztika: t=(x̄−μ₀)/(s/√n).

## Bayes-becslés és maximum likelihood
Bayes: posterior ∝ likelihood × prior. MLE: azt a paramétert keressük, amely a megfigyelt adatok likelihoodját maximalizálja. Normálmodellben ismert állandó szórás mellett a közép ML-becslése a mintaátlag.

## ADC, kvantálás, jelkondicionálás
Analóg-digitális átalakító mintavételez és kvantál. Ideális N bites, VFS teljes tartományú ADC lépésköze Δ=VFS/2ᴺ. Kvantálási hiba idealizáltan ±Δ/2, standard bizonytalanság Δ/√12. Az anti-alias szűrő a Nyquist fölötti komponenseket csökkenti a mintavétel előtt. Jelkondicionálás: erősítés, eltolás, szűrés, leválasztás.

## Mérési ablak és spektrális szivárgás
Véges időablakkal történő mérés a frekvenciatartományban konvolúciós hatást okoz; ha a jel nem egész számú periódusa van az ablakban, energia több FFT-binbe folyhat. Hann-ablak csökkentheti a szivárgást, de módosítja az amplitúdóskálát és a felbontást. Ha pontos amplitúdó kell, ablak koherens erősítésével korrigálni kell.

## Mérési zajok
Fehér zaj közel állandó PSD-vel; 1/f (flicker) zaj alacsony frekvenciákon nagyobb; hőzaj, kvantálási zaj és periodikus hálózati zavar más fizikai eredetű. Szűrést a hasznos jel sávszélességéhez kell igazítani.

## Koherencia
Két jel közös frekvenciás komponenseinek normalizált mértéke, megfelelő spektrális átlagolás után 0 és 1 között. Nem azonos a korreláció időtartománybeli egyetlen számával, hanem frekvenciafüggő.

## A vizsgán hogyan készüljek?
Először a 16 hivatalos tétel és az öt konzultáció feladata. Utána ezek. Az első forrás az elméleti kérdések külön vizsgalapja, a bővebb tematika nem bizonyítja, hogy minden pluszt külön tételként számon kérnek.
