# 7–12. elméleti tétel – statisztika, hibaterjedés, regresszió

## 7. Folytonos egyenletes eloszlás és jellemzői

**Vizsgaválasz:** X ~ U(a,b) esetén az [a,b] intervallumon a sűrűség állandó: f(x)=1/(b−a), azon kívül 0. Várható érték μ=(a+b)/2, variancia σ²=(b−a)²/12, szórás σ=(b−a)/√12. Eloszlásfüggvény az intervallumon F(x)=(x−a)/(b−a). Példa: műszer kvantálási/lekerekítési hibája −Δ/2 és +Δ/2 között közel egyenletes, u=Δ/√12.

**Tipikus hiba:** U(a,b) szórása nem (b−a)/2.

## 8. A mérés mint statisztikai mintavétel; várható érték és szórás becslése

**Vizsgaválasz:** Ismeretlen eloszlású (vagy ismert családba tartozó) mérési adatokból n elemű mintát veszünk: x₁…xₙ. A várható érték becslése a mintaátlag x̄=(1/n)Σxᵢ. A minta korrigált varianciája s²=(1/(n−1))Σ(xᵢ−x̄)², becsült szórás s=√s². Az n−1 a szabadságfok miatti Bessel-korrekció. Független, azonos eloszlású megfigyeléseknél x̄ torzítatlan becslés a várható értékre és s² torzítatlan a varianciára. A szórás s önmagában általában nem torzítatlan σ-becslés.

**Példa:** 10, 11, 12: átlag 11, korrigált szórás 1.

## 9. Számtani közép és a számtani közép becsült szórása

**Vizsgaválasz:** A számtani közép a várható értéket becsli. A minta elemeinek szórása s nem azonos a közép standard hibájával: s_x̄ = s/√n = √[Σ(xᵢ−x̄)²/(n(n−1))]. A közép standard hibája több független mérésnél csökken. Ha az adatok korreláltak, a s/√n képlet általában nem érvényes; effektív mintaszám vagy kovariancia figyelembevétele kell.

**Példa:** s=2 mm, n=25 → s_x̄=0.4 mm. Jelentés: x̄ ± s_x̄, ha standard bizonytalanságot adunk meg.

**Tipikus hiba:** „szórás = std(x)/sqrt(n)” – ez a közép szórása, nem a méréseké.

## 10. Közvetett mérések bizonytalansága és hibaterjedés

**Vizsgaválasz:** Ha y=f(x₁,…,xₖ), és az input mennyiségek becsült standard bizonytalanságai u(xᵢ), akkor kis bizonytalanságoknál elsőrendű Taylor-közelítéssel:
u²(y) ≈ Σᵢ [∂f/∂xᵢ]²u²(xᵢ) + 2Σᵢ<ⱼ (∂f/∂xᵢ)(∂f/∂xⱼ)Cov(xᵢ,xⱼ).
Független inputoknál a kovarianciás rész 0. A parciális derivált az érzékenységi együttható.

**Kötelező példák:**
- Téglatest: V=abc, független inputokra u(V)/V≈√[(u(a)/a)²+(u(b)/b)²+(u(c)/c)²].
- Gömb: V=πd³/6, u(V)=|πd²/2|u(d); relatív: u(V)/V≈3u(d)/d.
- Sűrűség: ρ=m/V; független inputokra u(ρ)/ρ≈√[(u(m)/m)²+(u(V)/V)²].
- Körkúp: V=πd²h/12; relatív: u(V)/V≈√[(2u(d)/d)²+(u(h)/h)²].

**Számolás:** m=15±0.1 g, V=5±0.2 cm³; ρ=3 g/cm³; u(ρ)=3·√[(0.1/15)²+(0.2/5)²]≈0.122 g/cm³.

**Ne keverd:** ha átlagból számítok egy jellemző méretet, a minta standard hibáját használjam; ha egy véletlenül kiválasztott legyártott termék szórása érdekel, akkor az egyedi adatok szórását. Ezek különböző feladatok.

## 11. Legkisebb négyzetek módszere

**Vizsgaválasz:** A mérési pontok és a modell közötti eltérések négyzetösszegét minimalizáljuk: S(θ)=Σ(yᵢ−ŷᵢ(θ))². Egyenesre ŷᵢ=mxᵢ+b, keressük m,b paramétereket úgy, hogy S minimális legyen. Mátrixban: β̂=(XᵀX)⁻¹Xᵀy, ha X teljes oszloprangú; numerikusan biztonságosabban X\y MATLAB-ban. Független, homoszkedasztikus hibáknál a becsült maradékvariancia s² = Σrᵢ²/(n−2), a paraméterek kovarianciája s²(XᵀX)⁻¹. Súlyozott LK szükséges, ha az egyes pontok varianciája eltérő.

**Példa:** ha x nő és y közel lineárisan nő, egyenesillesztéssel meghatározhatjuk a meredekséget és annak bizonytalanságát.

**Ne keverd:** a korreláció r nem azonos a meredekséggel. Az R² sem méri önmagában a modell helyességét.

## 12. Lineáris regresszió és linearizálás

**Vizsgaválasz:** A lineáris regresszió során y≈mx+b paramétereket becslünk adatokból. Nemlineáris fizikai törvényt algebrai átalakítással gyakran egyenes alakra hozunk; majd az illesztett paraméterekből visszaszámítjuk a fizikai paramétereket, és hibaterjedéssel a szórásaikat.

**Alappéldák:**
- Radioaktív bomlás: A(t)=A₀exp(−ln(2)t/T). Vegyük ln(A)=b+mt, ahol b=ln(A₀), m=−ln(2)/T. Ekkor T=−ln(2)/m, A₀=exp(b). Bizonytalanság: u(T)=|ln(2)/m²|u(m), u(A₀)=A₀u(b).
- Barométer: p(h)=p₀exp(−(ρ₀g/p₀)h). Legyen Y=ln p, X=h: m=−ρ₀g/p₀, b=ln p₀. Ekkor p₀=exp(b), ρ₀=−m·exp(b)/g. U(p₀)=p₀u(b). **ρ₀ bizonytalanságánál m és b illesztési kovarianciáját is számításba kell venni**, különben a becslés pontatlan lehet.

**Nagyon fontos korlát:** logaritmálni csak pozitív mért adatot lehet. A logaritmikus transzformáció megváltoztathatja a mérési hibák súlyozását; akkor célszerű, ha a feladat elvárja, és meg tudom indokolni.

## Példafeladat, papíron
x=[1,2,3], y=[2,4,6]. Az illesztett egyenes y=2x, tehát m=2, b=0. A maradék 0, mert a pontok pontosan egy egyenesre esnek. Valós adatoknál ellenőrzöm a reziduumábrát és a maradékok szórását.
