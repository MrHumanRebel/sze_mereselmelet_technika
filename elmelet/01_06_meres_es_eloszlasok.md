# 1–6. elméleti tétel – mérési alapok és eloszlások

Az eredeti, 16 pontos tételsor sorrendjét követem. Minden tételhez van egy vizsgán leírható rövid válasz, aztán az a rész, amit valóban érteni kell.

## 1. Mérés és mérési eljárások

**Vizsgaválasz:** A mérés egy fizikai mennyiség értékének kísérleti meghatározása, mérési eljárással és mértékegységgel. Közvetlen mérésnél a keresett mennyiséget közvetlenül mérjük (pl. tolómérővel hossz). Közvetett mérésnél más, megmért mennyiségekből számítjuk (pl. sűrűség: ρ = m/V). A mérési lánc részei a mérendő objektum, érzékelő, jelkondicionálás, adatgyűjtés és kiértékelés. Kalibrálásnál az eszköz jelzését ismert etalonértékekhez viszonyítjuk. Mérés végeredménye nem puszta szám: érték, mértékegység és bizonytalanság együtt.

**Példa:** 10.00 ± 0.03 mm. A ± nem azt jelenti, hogy biztosan ennyi a hiba, hanem az alkalmazott bizonytalansági modell szerinti becslést és lefedési információt kell megadni.

**Ne keverd:** pontosság (valós értékhez közel) ≠ precizitás (ismételt eredmények szórása kicsi).

## 2. Mértékegységrendszerek, SI

**Vizsgaválasz:** Az SI a nemzetközi mértékegységrendszer. A hét alapegység: méter (m), kilogramm (kg), másodperc (s), amper (A), kelvin (K), mól (mol), kandela (cd). Származtatott egységek például sebesség (m/s), erő: newton (N = kg·m/s²), nyomás: pascal (Pa = N/m²), energia: joule (J = N·m). A dimenzióanalízis ellenőrzi, hogy egy képlet mindkét oldalának ugyanaz a mértékegysége.

**Példa:** 5 mm = 0.005 m; 1 cm³ = 10⁻⁶ m³; 1 g/cm³ = 1000 kg/m³. A km/h → m/s átváltás: osztás 3.6-tal.

**Tipikus bukó:** mm és m, g és kg összekeverése a sűrűségnél.

## 3. Mérési bizonytalanság és fajtái

**Vizsgaválasz:** A mérési bizonytalanság a mérendő mennyiségnek tulajdonítható értékek szóródását jellemző nemnegatív paraméter. A hibát hagyományosan a mért érték és referenciaérték különbségének tekintjük, de az ismeretlen valódi hiba nem mérhető közvetlenül. Véletlen hatások az ismételt eredményeket szórják; rendszeres hatások eltolást okoznak; durva hibák hibás mérésből vagy adatkezelésből eredhetnek. A standard bizonytalanság u szórásjellegű. A-típusú becslés ismételt mérések statisztikájával, B-típusú más információból történik. Független komponensek összevonásánál: u_c = √(u₁² + u₂² + …). Kiterjesztett bizonytalanság: U = k·u_c; k≈2 gyakran közel 95%-os lefedettség normálmodellnél, de nem univerzális garancia.

**Példa:** a műszer nullpontja hibás → szisztematikus eltolás; zavaró környezeti zaj → véletlen szórás; elgépelés, rosszul leolvasott kijelző → durva hiba.

**Tipikus bukó:** minden 3σ feletti adat automatikus törlése. A 3σ szűrés vizsgán hasznos heurisztika, nem matematikai bizonyíték. Nagy mintában valódi 3σ-n kívüli adatok természetesen is előfordulnak.

## 4. Mérési eredmény mint valószínűségi változó

**Vizsgaválasz:** A mérést véletlen változóként modellezhetjük: X. Diszkrét változónál értékekhez valószínűségeket rendelünk, folytonos változónál sűrűségfüggvényt f(x). Eloszlásfüggvény: F(x) = P(X ≤ x); folytonosnál F(x) = ∫₋∞ˣ f(t)dt. Várható érték: E[X], szórásnégyzet: Var(X) = E[(X−E[X])²], szórás: σ = √Var(X). Két változó együttjárását kovariancia és korreláció jellemzi: ρ = Cov(X,Y)/(σXσY).

**Értsd:** a várható érték az elméleti eloszlás középértéke, a mintaátlag ennek a mért adatokból adott becslése.

**Tipikus bukó:** a sűrűségfüggvény magasságát valószínűségnek nézni. Valószínűséget folytonos esetben területtel számolunk.

## 5. Normál- (Gauss-) eloszlás és centrális határeloszlás-tétel

**Vizsgaválasz:** X ~ N(μ, σ²), sűrűsége f(x) = [1/(σ√(2π))]·exp(−(x−μ)²/(2σ²)). Az eloszlás haranggörbe, szimmetrikus μ körül. Körülbelül 68.27% esik μ±σ, 95.45% μ±2σ, 99.73% μ±3σ közé. A centrális határeloszlás-tétel szerint független, azonos eloszlású, véges varianciájú minták megfelelően standardizált összege/átlaga a mintanagyság növekedtével normáleloszláshoz tart. Ezért sok kis hatás összege közel Gauss-jellegű; az átlag szórása csökken: σ/√n.

**Példa:** ha a mért mennyiség szórása 4 mm és n=16 független mérésünk van, a közép szórása 4/√16 = 1 mm.

**Tipikus bukó:** a centrális tétel nem állítja, hogy az eredeti mérések eloszlása normális, és nem pótolja a függetlenséget.

## 6. Poisson-eloszlás és jellemzői

**Vizsgaválasz:** A Poisson-eloszlás független, ritka események adott idő-/téregységben előforduló darabszámát modellezi. P(X=k) = exp(−λ)·λ^k/k!, k=0,1,2,…, λ>0. Várható érték E[X]=λ; variancia Var(X)=λ; szórás σ=√λ. A folyamat megfelelő feltételeinél a külön időintervallumok esetszámai függetlenek, a várható eseményszám arányos az intervallum hosszával.

**Példa:** átlag 4 részecske/perc; annak valószínűsége, hogy egy percben pontosan 2 érkezik: exp(−4)·4²/2! ≈ 0.1465.

**Ne keverd:** Poisson: darabszám, diszkrét. Normál: folytonos, közép és szórás paraméterezésével.

## Gyorskérdések
1. Mi a különbség közvetlen és közvetett mérés között?
2. Írd fel az SI hét alapegységét!
3. Mi a standard és a kiterjesztett bizonytalanság?
4. Mi a különbség F(x) és f(x) között?
5. Mitől lesz kisebb a közép bizonytalansága?
6. Poisson(9) esetén mennyi a szórás? **3.**
