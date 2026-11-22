# Teljesen levezetett MATLAB-vizsgafeladatok I. – geometria és mérési statisztika

## A. Téglatest, 100 darab – eredeti feladat1

**Feladat:** 100 gyártott alkatrész a,b,c élét és m tömegét mérték. Volt-e durva hiba? Mennyi az élhosszak, tömegek és sűrűség szórása?

**0. lépés:** Betöltés után a,b,c oszlopvektorok, az m sorvektor. A MATLAB-ba mindet oszloppá alakítom: a(:),b(:),c(:),m(:). Egy sort egy gyártott darabnak értelmezek.

**1. lépés:** X=[a,b,c,m]. Minden oszlop átlagát és std szórását kiszámolom; abs(x−mean)>3*std alapján javasolt sorok kiválasztása, és az elvetés után ismét ellenőrzés. Az eredeti adatokon saját iteratív 3σ módszerrel a 12.,23.,56.,91. sor kerül megjelölésre; 96 sor marad. Más szűrési szabálynál eltérés lehet, ezt dokumentálom.

**2. lépés:** Tisztított átlagok kb. a=1.20121, b=1.79852, c=5.00060, m=13.07879. A korrigált mintaszórás a gyártott alkatrészek **egyedi variabilitását** írja le; az átlag standard hibája SEM=s/√96.

**3. lépés:** V=abc, rho=m/(abc). Deriváltak:
- ∂rho/∂a=−rho/a
- ∂rho/∂b=−rho/b
- ∂rho/∂c=−rho/c
- ∂rho/∂m=1/(abc)

**4. lépés:** Az adatok ugyanazokat a fizikai darabokat reprezentálják, így J*cov(X)*J' becsli az egyedi sűrűségváltozékonyságot, J*(cov(X)/n)*J' pedig az átlagokra épülő becslés standard varianciáját, független darabok mellett.

**Kontroll:** rho≈1.21063 [forrás-egységekből]. A PDF nem ad egyértelmű SI egységet, ezért nem írok rá önkényesen kg/m³-t. A saját script: 01_teglatest.m.

## B. Egyenes körkúp, 100 darab – eredeti feladat2

**Feladat:** 100 kúp M magassága és d alapkör-átmérője [mm]; anyagsűrűség 4432 kg/m³. Tömeg és bizonytalanság.

**0. lépés:** M és d vektorok. Azonos sorok ugyanazon kúphoz tartoznak.

**1. lépés:** Durvahiba-szűrés minden inputra, majd új statisztika. A saját iteratív 3σ vizsgálat 94 mintát tart meg; átlagok M≈8.50478 mm, d≈5.59077 mm.

**2. lépés:** SI: M_m=M_mm/1000, d_m=d_mm/1000. V=πd²M/12, tömeg m=ρV. A térfogat deriváltjai SI hosszmennyiségekre: ∂V/∂M=πd²/12, ∂V/∂d=πdM/6.

**3. lépés:** Ha rho pontos, u_m²=ρ²(u_V²). Ha az inputok összefüggenek: a két derivált és teljes 2×2 kovariancia kell. Ha rho bizonytalan: +(V*u_rho)² és szükség esetén kovarianciák.

**Kontroll:** m≈0.00030844 kg = 0.30844 g. Ez reális egy nagyon kis kúphoz. Script: 02_korkup.m.

## C. Forgási ellipszoid, 90 darab – valódi vizsgaminta

**Feladat:** a három megadott adat A,B,C teljes átmérő, mind mm, tömeg m g. A testet márványként írja le a feladat.

**1. lépés:** Ne téveszd össze a féltengelyeket és átmérőket: V=4πabc/3 = πABC/6, mert a=A/2, stb.

**2. lépés:** Szűrés és szórás. A saját 3σ ellenőrzés szerint 87 minta marad, 21,27,90 index megjelölésével. Átlagok A≈26.00184, B≈41.69379, C≈82.89540 mm, m≈1017.794 g.

**3. lépés:** V [mm³], rho=m/V [g/mm³], aztán szorozzuk 10⁶-tal, ha kg/m³ kell. Jρ=[−ρ/A,−ρ/B,−ρ/C,1/V]. A megfelelő Cov-ról dokumentálom, hogy egyedi vagy átlagra vonatkozik.

**Kontroll:** rho≈21630 kg/m³. Ez márványhoz irreális, **de ezt adják a mért adatok**. Itt a vizsgán nem találok ki új tömeget vagy új átmérőt: szakmai ellenőrzésként leírom az ellentmondást. Script: 07_szferoid.m.

## D. Csapágygolyó – csak szöveges feladat, az adat nem volt mellékelve

**Feladat:** 100 gömb d átmérőjét mérik, és kérik V átlagát, szórását és durvahiba-ellenőrzést.

**Képlet:** V=πd³/6, derivált πd²/2.
Példa: d=10.0±0.1 mm → V=523.599 mm³, u(V)≈15.708 mm³.

**Kód:** 15_csapagygolyo.m tényleges adatra, demo_13_csapagygolyo_szintetikus.m saját véletlen tesztadatra. Az eredeti csapagygolyo_atmero.mat a forráscsomagban nem volt jelen; nincs kitalált tanári kimenet.

## E. Csődarab – valós feladat, méretek + tehetetlenségi nyomaték

**Feladat:** D külső, d belső átmérő, h hossz; rho sűrűség. 2000 méret és 25 sűrűség mérés.

**Képletek:**
- tömeg = ρπh(D²−d²)/4
- Iz = ρπh(D⁴−d⁴)/32
- Ix = ρπh(D⁴−d⁴)/64 + ρπh³(D²−d²)/48

**Nem elég** egyetlen eredményszám: minden kimenetre négy részderivált, és u²=J·Cov·J'! A méretadatokat mm→m váltom, a rho kg/m³ marad.

**4σ csapda:** az oktatói PDF 2000 mintára a 4σ küszöböt választja, a saját ellenőrzésünk egy méretadatnál ≈4.0026 eltérést talál. Ez kerekítési/küszöb-határhelyzet, a tanár a teljes méretmintát elfogadhatónak írja le; ezért az elvetést **nem kezelem megdönthetetlen bizonyítéknak**.

**Tanári referencia:** m≈0.94±0.01 kg; Ix≈(9.85±0.14)·10⁻⁴ kg·m²; Iz≈(4.01±0.06)·10⁻⁴ kg·m². Script: 10_cso.m.

## Minden geometriás feladat végén ellenőrzöm
Helyes mértékegység? Átmérő/sugár? Képlet dimenziója? Az inputszórás egyedi vagy SEM? Korrelált input? Durva hiba megindokolva és újraellenőrizve? Ábra és komment megvan?
