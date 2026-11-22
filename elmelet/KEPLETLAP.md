# Képletlap – tudjam fejből, vizsgán meg tudjam indokolni

## Statisztika
- Átlag: x̄ = (Σxᵢ)/n.
- Korrigált mintaszórás: s = √[Σ(xᵢ−x̄)²/(n−1)].
- Az átlag becsült szórása: s_x̄ = s/√n (független megfigyelések).
- Normál: N(μ,σ²), ±1σ/±2σ/±3σ kb. 68.3/95.4/99.73%.
- Poisson: E[X] = Var(X) = λ; σ = √λ.
- Egyenletes [a,b]: μ=(a+b)/2; σ=(b−a)/√12.

## Hibaterjedés (elsőrendű)
- Független inputokra: u_y² ≈ Σ(∂f/∂xᵢ)²u_xᵢ².
- Korrelált inputokra: + 2Σᵢ<ⱼ (∂f/∂xᵢ)(∂f/∂xⱼ)Cov(xᵢ,xⱼ).
- Szorzat/hányados: relatív standard bizonytalanságok négyzetösszege, függetlenségnél.
- Gömb, átmérővel: V = πd³/6; u_V = (πd²/2)u_d.
- Téglatest: V = abc; ρ=m/(abc).
- Kúp: V = πd²h/12; m=ρV.
- Ellipszoid, három átmérővel D1,D2,D3: V = πD1D2D3/6.

## Regresszió és linearizálás
- Egyenes: y=mx+b.
- Illesztés: β = [x, 1]\y MATLAB-ban.
- Exponenciális bomlás: ln A = ln A0 − (ln2/T)t.
- Felezési idő: T = −ln2/m; u_T=|ln2/m²|u_m.
- Barométer: ln p = ln p0 − (ρ0 g/p0)h.
- p0=exp(b), ρ0=−m·exp(b)/g.

## Időjelek
- Mintavételezés: fs=1/Δt; fNyquist=fs/2; Δf=fs/N.
- Idő: t = (0:N−1)/fs.
- FFT: X=fft(x); egyoldali amplitúdó: |X|/N, majd minden nem-DC/nem-Nyquist bin *2.
- Korreláció: [c,lags]=xcorr(x,y), késés másodpercben = lags/fs.
- Visszhang-távolság: d= v·Δt/2.

## Egységek
- 1 mm = 0.001 m; 1 g = 0.001 kg; 1 mm³=10⁻⁹ m³.
- 1 g/cm³ = 1000 kg/m³.
- Standard szórás, közép standard hibája és kiterjesztett bizonytalanság nem felcserélhető.
