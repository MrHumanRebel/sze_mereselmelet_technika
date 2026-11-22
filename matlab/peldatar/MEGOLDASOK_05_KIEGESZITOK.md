# Teljesen levezetett példák V. – motorhatásfok, kalibráció, ADC, eloszlás, Monte Carlo

## A. Villanymotor hatásfokmező – valós extra konzultáció

**Forrásadat:** villanymotor.mat, 9988×3 adatokmotor. Oszlopok: fordulatszám [rpm], nyomaték [Nm], hatásfok [-].
Az azonos fordulatszám-nyomaték kombinációhoz több mért hatásfok tartozhat.

**1.** Betöltöm, ellenőrzöm: N×3, véges, értelmes hatásfok.
**2.** Egyedi (rpm, Nm) párokat kiválasztok.
**3.** Az ismétlődő párok hatásfokainak *mediánja* kerül a csoporthoz. Nem véletlenül medián: ellenállóbb szélső pontokra.
**4.** A tanári minta a csoportosított adat utolsó 4 sorát befejezetlen mérésként kihagyja. Ezt ebben az adatfájlban is feltüntetem, de más forrásnál nem automatikus.
**5.** Az azonos rpm csoporton belül nyomaték szerint rendezve helyi mozgóátlaggal finoman simítható a hatásfok.
**6.** Minden fordulatszámhoz a maximális hatásfok sorát választom, megtartva az ahhoz tartozó nyomatékot. **Nem globális egyetlen maximumot adok minden fordulathoz!**
**7.** 3D fordulat–nyomaték–hatásfok ábra és külön 2D optimális hatásfok-görbe.

**Script:** 20_villanymotor_hatasfok.m. Alapfüggvények: group_median_pairs.m, max_per_first_column.m.

## B. Mérőeszköz kalibrálás – saját kiterjesztés a 2026/27 tematikából

Mért műszerjel y=m·x+b, ahol x hiteles referenciaérték. **Kalibráció**: az eszköz meredekség/offset paramétereinek meghatározása.

Súlyozott illesztés eltérő abszolút mérési bizonytalanságokkal: W=diag(1/u_i²), β=(XᵀWX)⁻¹ XᵀWy; Covβ=(XᵀWX)⁻¹. Ha y kijelzésből x-et szeretnék becsülni: x=(y−b)/m, a fizikai inverz korrekció paraméterhibája a teljes (m,b) kovarianciával propagálódik.

**Script:** demo_15_sulyozott_kalibracio.m és 21_ket_szenzor_kalibracio.m.

## C. ADC és kvantálás – tematikai plusz

Ideális B bites, 5 V teljes tartományú ADC-nél Δ=5/2^B V. B=8: Δ=0.01953125 V, és ha a kvantálási hiba egyenletes [-Δ/2,Δ/2] modellen írható le, u=Δ/√12≈0.005638 V.
**Miért feltételes?** Valódi ADC lehet nemlineáris, offsetes, zajos, a kvantálási hiba pedig korrelálhat a jellel. A kvantálás és a mintavétel külön jelenség.

**Script:** demo_09_adc_kvantalas.m.

## D. Poisson, Gauss, uniform – eredeti elméleti listából

- Poisson λ=4: P(X=2)=e⁻⁴4²/2!≈0.146525, E=4, s=2.
- Egyenletes [-0.05,+0.05] mm: szórás (0.10)/√12≈0.0288675 mm.
- Standard normál eloszlásban P(−2≤Z≤2)≈95.45%.
- Centrális határeloszlás: az összeg/átlag standardizált eloszlása, nem feltétlen a nyers adat, közelít Gauss-alakhoz.

**Scriptek:** 22_egyenletes_es_poisson_feladat.m, demo_08_egyenletes_gauss_clt.m, demo_11_poisisson.m.

## E. Monte Carlo – saját numerikus kontroll

Ha f(x) nemlineáris, a Jacobian-alapú u megközelítés mellett generálok véletlen inputokat az ismert eloszlásukból, kimenet = f(x) minden mintán, végül std(y) és eloszlás. Nem helyettesíti a helyes bemeneti bizonytalanság-modellt.
**Script:** demo_19_jacobian_vs_montecarlo.m.

## F. Bayes, Maximum Likelihood, statisztikai teszt – tematikai plusz

MLE: az a paraméter, amelynek likelihoodja a megfigyelt mintán maximális. Normális hibamodellű, azonos varianciájú adatoknál a várható érték MLE-je a mintaátlag.
Bayes normál prior esetén a posterior a prior és likelihood pontosság-súlyozott kombinációja. Egymintás próba: H0:μ=μ0, p-érték nem az a valószínűség, hogy H0 igaz.
**Scriptek:** demo_20_bayes_mle.m és demo_21_hipotezis_z.m. Ezek a 2026/27-es tantárgytematikából készült saját gyakorlatok, nem igazolt korábbi MATLAB-vizsgafeladatok.

## Vizsgaszabály
Ha nem tudok egy számot megindokolni, akkor a kód önmagában nem megoldás. Mértékegység, fizikai modell, bemeneti adattisztítás, bizonytalanság és ábrás kontroll mindig legyen.
