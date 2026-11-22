# Méréselmélet és -technika — 7–12. tétel

## 7. Folytonos egyenletes eloszlás

Az [a,b] tartományon állandó a sűrűségfüggvény. Gyakori közelítés, amikor egy műszer lekerekítési vagy kvantálási hibáját az utolsó digit felén belül egyenletesnek vesszük.

> **X~U(a,b):** f(x)=1/(b−a) az [a,b] tartományban; μ=(a+b)/2; σ=(b−a)/√12.

**Számpélda:** a felbontás 0,1 mm, a hiba [−0,05,+0,05] mm. A standard bizonytalanság 0,1/√12≈0,0289 mm.

**Amire figyelek:** a maximális eltérés nem egyenlő a szórással; a valós műszernek a kvantáláson kívül más hibái is lehetnek.

## 8. A mérés mint statisztikai mintavétel

Több azonos típusú mérésből becsülöm az ismeretlen populáció jellemzőit. A mintaátlag a várható érték becslése. Az egyedi mérések szórását a **korrigált mintaszórással** számolom.

> **x̄ = (1/n)Σxᵢ; s² = [Σ(xᵢ−x̄)²]/(n−1); s=√s².**

Az n−1 osztó a szabadságfok miatti Bessel-korrekció. A korrigált mintavariancia független, azonos eloszlású minták esetén torzítatlan varianciabecslés. A szórás s ettől nem feltétlenül torzítatlan σ-becslés.

**Számpélda:** 9, 10, 11, 10 mm → átlag 10 mm; Σ(x−10)²=2 mm²; s=√(2/3)=0,8165 mm.

**MATLAB:** mean(x), std(x,0), measurement_stats(x).

## 9. A számtani közép becsült szórása

A gyártott darabok ingadozása és a becsült gyártási átlag bizonytalansága **nem ugyanaz**. Az egyik s, a másik s/√n, ha a mérések függetlenek.

> **s(x̄) = s/√n = √[Σ(xᵢ−x̄)²/(n(n−1))].**

**Számpélda:** a 4 mért darabnál s≈0,8165 mm, de az átlag standard hibája 0,4082 mm.

**Amire figyelek:** idősorban az egymást követő minták gyakran korreláltak; akkor a s/√n képlet alábecsülheti a bizonytalanságot. A feladatból először tisztázom, mit becsülök.

## 10. Közvetett mérések bizonytalansága — hibaterjedés

Ha a keresett mennyiség y=f(x₁,…,xₖ), a bemenetek bizonytalanságát a **parciális deriváltakkal** viszem tovább. A derivált megmutatja, hogy az adott bemenet kis változása mennyire változtatja meg a számított eredményt.

> **u²(y) ≈ J C Jᵀ**, J=[∂f/∂x₁,…,∂f/∂xₖ], C az inputok kovarianciamátrixa.

Független bemeneteknél az eredmény a deriváltak és standard bizonytalanságok négyzetes összegére egyszerűsödik. Korrelált inputoknál a kovariancia nem hagyható el.

**Kötelező testképletek:**
- Téglatest V=abc; ρ=m/(abc).
- Gömb V=πd³/6; u(V)=|πd²/2|·u(d).
- Körkúp V=πd²h/12; relatív u(V)/V≈√[(2u(d)/d)²+(u(h)/h)²] független inputokra.
- Ellipszoid három átmérőből V=πABC/6.

**Számpélda:** d=10,0±0,1 mm-es gömb. V=523,6 mm³; standard bizonytalanság kb. 15,7 mm³.

**Amire figyelek:** ugyanazon darab a,b,c,m mérései korrelálhatnak. A számított mennyiség standard bizonytalanságának a kimenettel azonos egysége van.

**MATLAB:** uncertainty_linear.m, demo_02_hibaterjedes.m.

## 11. Legkisebb négyzetek módszere

Egy adott fizikai modell paramétereit úgy választom meg, hogy a mért és számított y közti eltérések négyzetösszege minimális legyen. Egyenesre y≈mx+b: a paraméterek a meredekség m és a tengelymetszet b.

> **Minimalizálom:** Σ[yᵢ−(mxᵢ+b)]². **Mátrixosan:** β=[m;b]=X\y, X=[x,1].

A maradék r=y−Xβ. A klasszikus modellben sᵣ²=(rᵀr)/(n−2); a paraméterek kovarianciája sᵣ²(XᵀX)⁻¹. Az illesztés ezért **m és b standard bizonytalanságát** is megadja.

**Számpélda:** x=[0,1,2], y=[1,3,5]. A meredekség m=2, a tengelymetszet b=1. Az adatok pontosan az egyenesen vannak, a reziduum 0.

**Amire figyelek:** R² közel 1 önmagában nem jelenti, hogy a fizikai modell jó. A reziduumot és a mértékegységeket is megvizsgálom.

**MATLAB:** fitline_ols.m, demo_03_regresszio.m.

## 12. Lineáris regresszió és linearizálás

Nem minden fizikai modell lineáris, de több modell átalakítható egyenesre. A lényeg nem csak az egyenesillesztés: az **eredeti fizikai paramétereket és azok bizonytalanságát vissza kell számolni**.

A radioaktív bomlás A(t)=A₀exp[−(ln2)t/T] logaritmizálva ln A=b+mt. Itt b=ln A₀ és m=−ln2/T.

> **T = −ln(2)/m; A₀ = exp(b); u(T)=|ln2/m²|u(m); u(A₀)=A₀u(b).**

**Számpélda:** m=−0,0020±0,0001 s⁻¹. Ebből T≈346,6 s és u(T)≈17,3 s.

**Barométermodell:** p(h)=p₀exp[−ρ₀gh/p₀], ezért ln p=ln p₀−ρ₀gh/p₀. Ha a logaritmikus egyenes meredeksége m, tengelymetszete b, akkor p₀=exp(b), ρ₀=−m exp(b)/g. A ρ₀ bizonytalanságánál a m és b kovarianciája is számít.

**Két szakaszos regresszió:** a baba feladatában két külön egyenest illesztek, a heti növekedés 7m [g/hét], az étrendváltás ideje a két egyenes metszéspontja.

**Amire figyelek:** logaritmust csak pozitív adatra veszek. A transzformáció megváltoztathatja a zaj súlyozását, így szükség esetén más illesztési modellt kell indokolni.

**MATLAB:** peldatar/09_radioaktiv.m, 06_barometer.m, 08_baba.m.
