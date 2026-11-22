# Méréselmélet és -technika — 1–6. tétel

## 1. Mérés és mérési eljárások

Mérésnél egy fizikai mennyiség értékét határozom meg valamilyen eljárással. A végeredmény nem önmagában egy szám: kell hozzá a mértékegység és a bizonytalanság is.

**Közvetlen mérésnél** magát a keresett mennyiséget mérem. Például egy hosszúságot tolómérővel. **Közvetett mérésnél** több mérési adatból számolok: a sűrűséghez megmérem a tömeget, a térfogatot pedig a geometriai méretekből kapom.

A mérési lánc tipikus sorrendje: mérendő objektum → érzékelő → jelkondicionálás → adatgyűjtés → kiértékelés. A kalibrálás során a műszer jelzését ismert referenciaértékekhez hasonlítom. A kalibrálás nem feltétlenül azonos a műszer beállításával.

> **Alapképlet:** ρ = m/V

**Számpélda:** m=48 g, V=24 cm³. A sűrűség ρ=2 g/cm³, vagyis 2000 kg/m³.

**Amire figyelek:** pontosság és precizitás nem ugyanaz. A mérés lehet nagyon megismételhető, miközben rendszeresen eltér a referenciától.

**MATLAB:** load, whos, plot, mean, std. A vizsgán először az inputot ellenőrzöm, nem azonnal illesztek.

## 2. Mértékegységrendszerek, SI

Az SI alapegységei: **méter (m), kilogramm (kg), másodperc (s), amper (A), kelvin (K), mól (mol), kandela (cd)**. Ezekből származtatott mennyiségek adódnak: N=kg·m/s², Pa=N/m², J=N·m.

Mértékegységet minden bemenetnél és minden számított eredménynél megadok. A dimenzióanalízis gyors ellenőrzés: egy helyes fizikai képlet két oldalának azonos dimenziójú kell lennie.

> **Átváltás:** 1 mm = 10⁻³ m; 1 mm³ = 10⁻⁹ m³; 1 g/cm³ = 1000 kg/m³.

**Számpélda:** a kúp magassága 8,5 mm, átmérője 5,6 mm. Ha a térfogatot m³-ben kérem, 0,0085 m és 0,0056 m kerül a képletbe. A hosszegység ezerszeres eltérése térfogatnál már milliárdszoros hibát okozhat.

**Amire figyelek:** átmérő ≠ sugár; grammból kilogramm, milliméterből méter. A köbös átváltás különösen könnyen elcsúszik.

## 3. Mérési bizonytalanság és fajtái

A **mérési hiba** a mért érték és egy referenciaérték különbsége. A **mérési bizonytalanság** a mérendő mennyiségnek tulajdonítható értékek szóródását jellemzi. Az utóbbit akkor is becsülni tudom, ha a valódi értéket nem ismerem pontosan.

A véletlen hatások szóródást okoznak, a rendszeres hatások eltolást. Durva hiba lehet például elgépelés, rossz leolvasás vagy hibás eszközhasználat. A-típusú bizonytalanságot mérési adatsor statisztikájából, B-típusút más információból (kalibrálás, gyártói specifikáció) becsülök.

**Standard bizonytalanság:** szórásjellegű u. **Kiterjesztett bizonytalanság:** U=k·uᶜ, ahol a k lefedési tényező. Normálmodell és megfelelő feltételek mellett k≈2 gyakran közel 95%-os lefedettséghez tartozik; nem általános garancia.

> **Független komponensek:** uᶜ = √(u₁² + u₂² + ⋯).

**Számpélda:** u₁=0,3 mm és u₂=0,4 mm. Az összevont standard bizonytalanság √(0,09+0,16)=0,5 mm. k=2-vel U=1,0 mm.

**Amire figyelek:** az „±0,1” után mindig leírom, hogy az standard szórás, standard bizonytalanság vagy kiterjesztett bizonytalanság.

## 4. A mérési eredmény mint valószínűségi változó

Ha ugyanazt a mennyiséget újra és újra mérem, az eredmény változhat. Ezt **X véletlen változóként** modellezem. Diszkrét például az események száma, folytonos a mérőműszerrel meghatározott átmérő.

Az eloszlásfüggvény F(x)=P(X≤x). Folytonos eloszlásnál a sűrűségfüggvény f(x), amelynek egy intervallum alatti területe adja az adott tartomány valószínűségét. Várható érték E[X]; variancia Var(X)=E[(X−E[X])²]; szórás σ=√Var(X).

> **Alap:** F(x)=P(X≤x), σ²=E[(X−E[X])²].

**Számpélda:** a 9, 10 és 11 mm értékek azonos valószínűségűek. E[X]=10 mm. A populáció varianciája (1+0+1)/3=2/3 mm².

**Amire figyelek:** a sűrűségfüggvény magassága önmagában nem valószínűség. Folytonos változónál területet integrálok.

## 5. Normáleloszlás és centrális határeloszlás

A normál- vagy Gauss-eloszlás szimmetrikus haranggörbe. Két paramétere μ és σ. A minták nagyjából 68,27%-a van μ±σ, 95,45%-a μ±2σ és 99,73%-a μ±3σ között.

A **centrális határeloszlás-tétel** nem azt mondja, hogy minden mérési adat normális. Feltételek mellett független, azonos eloszlású, véges varianciájú változók standardizált átlaga a mintaszám növekedtével normáleloszláshoz tart.

> **Normál sűrűség:** f(x)=exp[−(x−μ)²/(2σ²)]/(σ√(2π)); **átlag szórása:** σ/√n.

**Számpélda:** egy mérés szórása 4 mm. Ha 16 független mérést átlagolok, az átlag szórása 4/√16=1 mm.

**Amire figyelek:** a 3σ-n kívüli adat nem automatikusan durva hiba. Nagy mintában normális modellből is várható néhány szélsőérték.

**MATLAB:** demo_08_egyenletes_gauss_clt.m, demo_01_statisztika.m.

## 6. Poisson-eloszlás és jellemzői

Darabszámok modellje: például mennyi részecske érkezik egy perc alatt, vagy hány ritka esemény történik egy meghatározott időablakban. A Poisson-eloszlás diszkrét, k=0,1,2,… értékeket vesz fel.

Az eloszlás paramétere λ az adott intervallum várható eseményszáma. A várható érték és a variancia egyaránt λ, ezért a szórás √λ.

> **Poisson:** P(X=k)=e⁻λ·λᵏ/k!, E[X]=λ, Var(X)=λ.

**Számpélda:** λ=4 esemény/perc. Pontosan 2 esemény valószínűsége exp(−4)·4²/2≈0,1465, a szórás √4=2.

**Amire figyelek:** λ lehet nem egész, a megfigyelt eseményszám mindig egész. A modell alkalmazhatóságához az eseményfolyamat feltételeit is mérlegelem.

**MATLAB:** demo_11_poisisson.m.
