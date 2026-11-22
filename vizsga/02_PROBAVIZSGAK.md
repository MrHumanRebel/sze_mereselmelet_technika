# Próbavizsgák – feladatlappal és önellenőrzéssel

## A változat – mérési statisztika + hibaterjedés (120 perc)
Egy gyártósor N=50 téglatestet ellenőriz. A méretek mm-ben, tömeg g-ban adottak. Van egy szándékosan megváltoztatott szélsőérték.
1. Vizsgáld meg a bemeneti méréseket, azonosítsd az indokoltan elvetendő adatokat, és dokumentáld.
2. Számold ki a méretek és tömeg becsült átlagát, egyedi szórását, közép szórását.
3. Számold ki a téglatest térfogatát és sűrűségét, mindkettő bizonytalanságával; add meg kg/m³-ben is.
4. Mutass be szemléletes ábrát, kommentekkel.
5. Egyetlen clean script legyen, amely újra fut.

**Ellenőrzés:** π nincs a térfogatképletben; V=abc, ρ=m/V; s_x̄=s/√N; a derivatekkel Gauss-hibaterjedés; a mért egyedi szórás nem egyenlő a közép szórásával.

## B változat – logaritmikus regresszió (120 perc)
Adottak aktivitásmérések egy exponenciálisan bomló mintából.
1. Rajzold fel A(t) adatait.
2. Linearizáld ln A = b + mt, kizárólag A>0 esetén.
3. Illessz egyenest; add meg m,b és standard hibáikat.
4. Számítsd ki a felezési időt és standard bizonytalanságát.
5. Visszaalakítva rajzold fel az eredeti és az illesztett jelet.

**Ellenőrzés:** m negatív, T pozitív, időegység megmarad; R² és reziduumábra önmagukban nem pótolják a fizikát.

## C változat – visszhang és jelanalízis (120 perc)
Adott két zajos jel, fs=22000 Hz, a hangsebesség 1500 m/s.
1. Időtengely és szemrevételezés.
2. Detrend, ha indokolt kímélő simítás.
3. Keresztkorreláció, késéstengely mintában és másodpercben.
4. Késésből távolság: d=v·|lag|/(2fs).
5. A csúcs lokalizálási bizonytalanságára adj indokolt becslést, és azt propagáld a távolságra.

**Ellenőrzés:** a hang oda-vissza megy; a korrelációt megfelelően értelmezem; két jel felcserélése az előjelet változtatja.

## D változat – rezgés és FFT (120 perc)
Adott x[n] zajos szinusz, fs=10 Hz.
1. Ábrázolás időben.
2. Sima mozgóátlag vagy SG, indoklással.
3. Periódusidő becslése csúcsok közötti távolságból.
4. FFT-alapú frekvencia- és amplitúdóbecslés.
5. Nyquist és Δf megadása.

**Ellenőrzés:** a periódusidő a frekvencia reciproka; frekvenciatengely helyes; a DC-t nem duplázom; a spektrális szivárgás befolyásolhatja a csúcsot.

## Elméleti próbavizsga – 30 perc/tétel
- 1. kör: magyarázd el a 10. tételt, és vezess le egy sűrűség-hibaterjedést.
- 2. kör: magyarázd el a 12. tételt, és linearizálj egy bomlást.
- 3. kör: magyarázd el a 15. és 16. tételek közti különbséget.
- 4. kör: magyarázd el a 3. és 9. tételt konkrét számpéldán.

**Értékelési önellenőrzés:** kap-e a válaszban definíció, fő képlet, jelölés, mértékegység, példa, egy korlát? Ha bármelyik hiányzik, javítsd.
