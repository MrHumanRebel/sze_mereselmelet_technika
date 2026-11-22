# 3. feladattípus – egyenesillesztés, felezési idő, barométer, baba

## OLS – legkisebb négyzetek
y=mx+b, X=[x,1], β=[m;b]=X\y. Reziduum r=y−Xβ, becsült maradékvariancia s²=Σr²/(n−2), Cov(β)=s²(XᵀX)⁻¹. A paraméter standard hibái ennek átlóelemei gyökei. **A szimpla polyfit nem elegendő, ha a feladat szórást is kér.** A repo fitline_ols.m segédfüggvénye visszaadja a kovarianciát, r, R² és reziduum értékeit.

## Radioaktív bomlás – rad_bomlas.mat
A(t)=A0·exp[−(ln2)t/T]. Logaritmizálva ln A=b+mt; b=ln A0, m=−ln2/T.
Vissza: A0=exp b, T=−ln2/m.
u(A0)=A0 u(b); u(T)=ln2·u(m)/m².
**Tanári referencia:** m≈−9.7631·10⁻⁵ s⁻¹, b≈11.1676, T≈7099.6±43 s, A0≈70801±882 Bq.
Csak pozitív aktivitást logaritmizálunk.

## Barométer – barometer.mat
p(h)=p0·exp[−ρ0gh/p0], így ln p=b+mh, p0=e^b és ρ0=−m e^b/g.
A ρ0 teljes bizonytalanságának érzékenysége [m,b] szerint J=[−p0/g,ρ0]; **u²(ρ0)=J·Cov(m,b)·Jᵀ**.
A feltöltött 51 sorban három nem pozitív p adat van: **48., 49., 51. sor**. Ezek nem logaritmizálhatók. A többi 48 pozitív sorból OLS: m≈−0.01231035, b≈6.86883, p0≈961.83 a forrás egységében. A tanári leírás szerint önkényes egységekről van szó, ezért az ebből kapott rho számra **nem lehet SI kg/m³-t állítani** mértékegység-konverzió bizonyítása nélkül.

## Baba – baba1.mat
A tömeget 12 óránként (0.5 naponként) mérték. Két lineáris szakasz: anyatej y1=m1·t+b1, tápszer y2=m2·t+b2. Heti növekedés 7m1 és 7m2 g/hét, hibája 7u(m1), 7u(m2).
Átállás: t*=(b2−b1)/(m1−m2), hibaterjedésnél a két illesztés m/b kovarianciája is fontos. A feltöltött 2026-os tanári példa 13,41,49 minta kezelésével, kezdeti fogyás elhagyásával dolgozik. **Más adatnál más szegmenseket kell választani!**

## Általános linearizálási gyorssúgó
| Modell | Lineárisítás | Visszaalakítás |
|---|---|---|
| y=Ae^(kx) | ln y=b+mx | A=e^b, k=m |
| y=A x^p | ln y=b+p ln x | A=e^b, p=m |
| y=A/x+B | y=m(1/x)+b | A=m, B=b |
| y=1/(A+Bx) | 1/y=mx+b | A=b, B=m |

A logaritmus y>0 feltételt és más hibamodellt is jelenthet. Minden fizikai visszaalakításhoz külön standard bizonytalanságot kell adni.

## Plusz: kalibráció
A tematikából levezetett saját változat: ismert x etalonhoz mért y jel, y≈mx+b. Kalibrált x=(y−b)/m. Ha a pontok y-standard bizonytalansága eltér, súlyozott LK indokolt.
