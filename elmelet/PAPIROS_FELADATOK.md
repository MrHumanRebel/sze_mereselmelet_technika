# Papíros számolások – részletesen, kézzel is követhetően

## 1. Átlag és szórás
Mérések: 9, 10, 11, 10 mm. n=4. x̄=(9+10+11+10)/4=10 mm. Négyzetes eltérések: 1+0+1+0=2 mm². s²=2/(4−1)=2/3 mm². s≈0.8165 mm. A közép szórása s_x̄≈0.4082 mm. **A kettőt tilos összekeverni.**

## 2. Egyenletes eloszlás
Kvantálási hiba [−0.05,+0.05] mm intervallumon. Várható érték 0, standard szórás 0.10/√12≈0.02887 mm.

## 3. Poisson
Ha átlag λ=3 esemény/perc, pontosan 0 esemény valószínűsége e⁻³≈0.0498. E[X]=3, σ=√3≈1.732.

## 4. Gömb térfogat és bizonytalanság
d=(10.0±0.1) mm. V=π·10³/6≈523.60 mm³. ∂V/∂d=πd²/2=50π mm². u(V)=50π·0.1≈15.71 mm³. Eredmény: (523.6±15.7) mm³ standard bizonytalansággal. **A szórásnak is térfogat-egysége van.**

## 5. Téglatest sűrűség
a=2.0±0.1 cm, b=3.0±0.1 cm, c=4.0±0.1 cm, m=48±1 g, független inputok. V=24 cm³, ρ=2.0 g/cm³. Relatív u_ρ/ρ=√[(1/48)²+(0.1/2)²+(0.1/3)²+(0.1/4)²] ≈0.0677. Így u_ρ≈0.135 g/cm³. Eredmény: (2.00±0.14) g/cm³. Egyedi darab szórása vs gyártási átlag bizonytalansága: külön kérdés!

## 6. Egyenes illesztése kézzel
x: [0,1,2], y:[1,3,5]. x̄=1, ȳ=3. Meredekség m=Σ(x−x̄)(y−ȳ)/Σ(x−x̄)²=(2+0+2)/(1+0+1)=2. Tengelymetszet b=ȳ−mx̄=1. Így y=2x+1. A pontok pontosan rajta vannak, a reziduum nulla.

## 7. Exponenciális felezési idő
Illesztett logaritmikus egyenes m=−0.0020±0.0001 s⁻¹, b=4.0±0.02. T=−ln2/m≈346.6 s. u_T=ln2/m²·u_m≈17.33 s. A₀=e⁴≈54.60, u(A₀)=A₀·0.02≈1.09. Nem elég T-t kiírni: a hibát is meg kell adni.

## 8. Visszhang
fs=2000 Hz, a két jel eltolása |lag|=800 minta, v=340 m/s. Δt=800/2000=0.4 s, d=340·0.4/2=68 m. Ha a csúcs helye ±3 minta pontosságú, akkor u_d=340·3/(2·2000)=0.255 m. Ha a hangsebesség is bizonytalan, azt is be kell vonni a hibaterjedésbe.

## 9. FFT
fs=1000 Hz és N=2000: mérési idő N/fs=2 s, frekvenciafelbontás 0.5 Hz, Nyquist=500 Hz. Egy 50 Hz-es, 3 egység amplitúdójú szinusz ideális, egészperiódusos mintában egyoldali FFT-n kb. 3-as csúcsot ad 50 Hz-en.

## 10. Regressziós egységváltás
Baba tömegnövekedése m=18 g/nap, u_m=2 g/nap. Heti növekedés: 7m=126 g/hét és u=7·2=14 g/hét. A szórás is szorzódik héttel.

## 11. Kúp
d=20±0.2 mm, h=50±0.5 mm, ρ=4432 kg/m³. d=0.020 m, h=0.050 m. V=πd²h/12 ≈5.236·10⁻⁶ m³. m=ρV≈0.02321 kg. Független bemeneteknél relatív u_m/m≈√[(2·0.0002/0.020)²+(0.0005/0.050)²]≈0.02236, tehát u_m≈0.000519 kg.

## 12. Miért nem mindegy a 3σ és 4σ?
Normálmodellnél P(|Z|>3)≈0.0027. 25 mérésből a várható 3σ-n túli darabszám 0.0675; 2000-ből viszont ~5.4! Ha minden 3σ-n túli pontot durva hibának mondanék, nagy adatsorban várhatóan valódi adatokat is törölnék. A konzultációs csőpélda emiatt mérlegel 4σ-t. Ez statisztikai szabály, nem tévedhetetlen eljárás.
