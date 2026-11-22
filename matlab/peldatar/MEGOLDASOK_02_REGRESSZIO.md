# Teljesen levezetett MATLAB-vizsgafeladatok II. – linearizálás és regresszió

## A. Radioaktív bomlás – tanári feladat

**Kérdés:** preparátum felezési ideje és szórása, valamint kezdeti aktivitása.

**1. Grafikon:** t vs A, csökkenő görbe; nem-negatív aktivitás ellenőrzése. **2. Linearizálás:** A=A0 e^(−ln2*t/T), ezért ln A=ln A0−(ln2/T)t. Átalakítás: Y=ln A, X=t. Illesztés: Y=mt+b.

**3. Paraméterek:** m=−ln2/T, b=ln A0. A fitline_ols az OLS-t és a becsült paraméter-kovarianciát adja. Nem elég pusztán polyfit: kell u_m és u_b.

**4. Visszafejtés:** T=−ln2/m, A0=e^b. Hibaterjedés: u_T=ln2/m²·u_m; u_A0=A0·u_b. A mért A pontos előjelei ellenőrzendők.

**5. Tanári referencia:** m≈−9.7631·10⁻⁵ s⁻¹, u_m≈5.9879·10⁻⁷ s⁻¹, b≈11.1676, u_b≈0.0125; T≈7099.6±43 s, A0≈70801±882 Bq.

**Miért lehet eltérés?** A logaritmizálás a hibamodellel együtt változik; nagy relatív zaj esetén az eredeti fizikai modellhez súlyozás vagy nemlineáris illesztés lehet indokolt, de a tanári feladat a log-linearizálásra épül.

**MATLAB:** 09_radioaktiv.m.

## B. Barométer – eredeti 6. feladat

**Kérdés:** p0 tengerszinti nyomás, rho0 levegősűrűség és bizonytalanság.

p(h)=p0 exp[−rho0 g h/p0].
**1.** A mért p pozitív kell legyen loghoz. A forrásban 51 p adatból 48.,49.,51. nem pozitív – ezt fel kell tüntetni és **logaritmizálás előtt** kezelni.
**2.** ln p=b+mh, ahol b=ln p0 és m=−rho0*g/p0.
**3.** OLS: [m,b] és kovarianciamátrix.
**4.** Vissza: p0=e^b; rho0=−m e^b/g.
**5.** A rho0 deriváltjai m és b szerint: [−p0/g, rho0]. u²(rho0)=J Cov(m,b) Jᵀ; a paraméterek kovarianciáját is megtartom.

**Ellenőrző forrásadat-becslés:** csak pozitív p-kre m≈−0.01231035, b≈6.86883, p0≈961.83. Tanári megjegyzés: az adatsor egységei nem hiteles SI-egységek. Ezért a ρ0 számot **nem** nyomtatom magyarázat nélkül „kg/m³” felirattal. Az eredeti feladatszöveg g=9.806 m/s² értéket használ.

**MATLAB:** 06_barometer.m.

## C. Baba – két külön regressziós szakasz

**Kérdés:** heti gyarapodás anyatejjel és tápszerrel, valamint a váltás ideje.

**1. Időtengely:** 54 mérés 12 óránként: t=0,0.5,...,26.5 nap. A forrásban eleinte csökken a súly, ez nem releváns a két lineáris gyarapodási modellhez. A tanári 2026-os mintamegoldás 13.,41.,49. adatot durva hibának tekinti, majd az első 6 mérést kihagyja.

**2. Szegmensek:** a fennmaradt adatsoron anyatejes rész 1:23, tápszeres rész 25:end, 24. átmeneti minta kimarad. Külön egyenes y1=m1 t+b1, y2=m2 t+b2.

**3. Heti eredmények:** 7m1, 7m2 [g/hét], bizonytalansága 7u(m1), 7u(m2). Ez azért 7, mert a meredekség g/nap egységű.

**4. Metszéspont:** t*=(b2−b1)/(m1−m2). Ha m1≈m2, az átállási idő instabillá válik! A két független illesztés m/b kovarianciájából az elsőrendű hibaterjedés számolható.

**A forrásra épülő numerikus kontroll:** 1. meredekség ≈57.2165 g/nap → 400.52±6.88 g/hét; 2. meredekség ≈32.9701 g/nap → 230.79±2.95 g/hét; átváltás ≈14.80 napos korban. Ezek a tanári szegmensválasztással számított értékek. A váltási idő további modell-/szegmensbizonytalanságát ne keverd a puszta regressziós standard hibába.

**MATLAB:** 08_baba.m.

## D. Általános egyenes, saját papírvariáns

x=[0,1,2], y=[1,3,5].
Átlagok x̄=1, ȳ=3. Meredekség: Σ(x−x̄)(y−ȳ)/Σ(x−x̄)²=(2+0+2)/(1+0+1)=2. b=ȳ−mx̄=1. A reziduum 0, mert pontosan egyenes.

## E. Nemlinearitás linearizálásának gyors menete

- Exponenciális: y=Ae^(kx) → ln y=ln A+kx, A=e^b.
- Hatvány: y=A x^p → ln y=ln A+p ln x, csak pozitív x,y.
- Inverz: y=1/(A+Bx) → 1/y=A+Bx, kizárva y=0.
- Fordított: y=A/x+B → y=A·(1/x)+B, kizárva x=0.

**Vizsgasorrend:** mérés-grafikon → adatellenőrzés → fizikai képlet → linearizálás → OLS → paraméterek és kovariancia → visszafejtés → hibaterjedés → eredeti skálán kontrollábra.
