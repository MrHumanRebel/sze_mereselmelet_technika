# 2. feladattípus – geometriai testek, sűrűség, tömeg, hibaterjedés

## Univerzális recept
Legyen y=f(x1,...,xk), érzékenység J=[∂f/∂x1 ... ∂f/∂xk]. Standard bizonytalanság becslése elsőrendű közelítésben: **u(y)=√(J·C·Jᵀ)**, ahol C a bemeneti becslések kovarianciamátrixa. Független bemeneteknél u²(y)=Σ[∂f/∂xi]² u²(xi). Kicsi szórásnál ez jó közelítés; erős nemlinearitásnál Monte Carlo kontroll hasznos.

## Téglatest – teglatest1.mat
V=abc; ρ=m/(abc). A gradiens sorrendje [a,b,c,m]: Jρ=[−ρ/a,−ρ/b,−ρ/c,1/(abc)].
Egyedi alkatrészszórás → az egyedi mérések kovarianciája; a gyártási átlag becslési bizonytalansága → Cov/n. A kettő nem ugyanaz.

A feltöltött 100 soros adaton az iteratív 3σ-szűrés egyik lehetséges eredménye 96 megtartott darab, kizártak 12,23,56,91. Átlag: a≈1.20121, b≈1.79852, c≈5.00060, m≈13.07879, ρ≈1.21063 **a fájlban használt egységekkel**. A forrásfeladat nem igazolja egyértelműen az SI mértékegységet.

## Kúp – korkup1.mat
Magasság M és átmérő d **mm**; sűrűség 4432 kg/m³. V=πd²M/12, m=ρV. Előbb mm→m. J=[ρπd²/12,ρπdM/6], a két SI hosszúság sorrendjében.
A saját 3σ-ellenőrzés után tipikus számérték: M≈8.50478 mm, d≈5.59077 mm, m≈0.30844 g. **A tömeg és a becsült tömeg szórása mindkettő kg vagy g.**

## Ellipszoid – szferoid1.mat
A,B,C a teljes **átmérők**. Tanári képlet féltengelyekre: V=(4/3)πabc, az átmérőkkel: V=πABC/6. Tömeg m grammban, méretek mm-ben → rho [g/mm³], az SI-ra szorzó 10⁶.
A saját 3σ-ellenőrzés után ρ≈21630 kg/m³, ami márványnak irreálisan nagy. A feladatszöveg „márványt” mond, az adatok ellentmondanak ennek: ezt jelezni kell, nem az értékeket önkényesen átírni.

## Gömb/csapágygolyó – feladatok.pdf
V=πd³/6; dV/dd=πd²/2; u(V)=πd²/2·u(d).
Papírpélda: d=10.0±0.1 mm → V=523.60±15.71 mm³.
A forrás szövegében említett csapagygolyo_atmero.mat **nem található meg** a feltöltött archívumban: a repo saját szintetikus demót és adatfogadó sablont ad.

## Cső – cso_adatok.mat
m=ρπh(D²−d²)/4.
Iz=ρπh(D⁴−d⁴)/32.
Ix=ρπh(D⁴−d⁴)/64+ρπh³(D²−d²)/48.
D,d,h mm→m, rho kg/m³. A forrás 2000 méretmérést és 25 sűrűségmérést ad. A 4σ határnál van egy kb. 4.0026 szabványosított eltérésű adat; a tanári PDF ezt a sort nem nevezi durva hibának. Nem kezelhető biztos hibaként ellenőrzés nélkül.
Tanári referencia: m≈0.94 kg, Ix≈9.85·10⁻⁴, Iz≈4.01·10⁻⁴ kg·m².

## Gyakori bukók
Átmérőt sugárnak kezelni; mm-t méternek venni; cov/n téves használata az egyedi darab szórására; a bemeneti kovariancia figyelmen kívül hagyása; a bizonytalanság mértékegységének elrontása.
