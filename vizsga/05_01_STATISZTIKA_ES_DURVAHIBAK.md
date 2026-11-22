# 1. feladattípus – mérési adatsor, becslés és durva hibák

## Mire kérdeznek rá?
Ha 100 alkatrészt mértek, a **becsült gyártási átlag** x̄=(Σxᵢ)/n. Az **egyedi mért értékek korrigált mintaszórása** s=√[Σ(xᵢ−x̄)²/(n−1)]. Az átlag **standard hibája**, független adatokra, SEM=s/√n. Három különböző mennyiség.

## Vizsga-recept
1. Betöltés: a munkaterületen a változók neveit és méretét ellenőrzöm.
2. NaN, Inf, fizikailag lehetetlen mérés és potenciális durva hiba keresése MINDEN bemeneten.
3. Grafikon az eredeti adatokról és a küszöbökről.
4. A tanári példákban kis mintán jellemzően 3σ, a 2000-szer mért csőnél 4σ küszöb van; a küszöb átlépése **nem bizonyíték önmagában**.
5. Indokolt elvetés után újraszámolom az átlagot és a szórást, majd ismét ellenőrzöm.
6. Ha a sorok azonos alkatrészhez tartoznak, egész sort távolítok el, nehogy szétcsússzon az a,b,c,m párosítás.
7. Kiírom a n, átlag, s, SEM, kizárt eredeti sorindexek és mértékegység értékét.

## Tanári ingapélda
Az 1. konzultációs inga_lengesideje.m 15 időadatot tartalmaz: 29.729, 26.711, 27.787, 26.457, 27.158, 27.200, 28.801, **34.318**, 28.157, 26.264, 27.404, 28.274, 28.964, 29.513, 28.193.
A tanár a 8. adatot távolítja el. Feladat: ugyanabból a nyers vektorból számold ki a szűrés előtti és utáni x̄, s és SEM értékeket; rajzold be ±3s határokat. Megoldó script: matlab/peldatar/17_inga.m.

## Papíros számpélda
x=[9,10,11,10] mm. n=4, x̄=10 mm, s=√(2/3)=0.8165 mm, SEM=0.4082 mm.
Ha a feladat „a gyártott alkatrészek szórását” kérdezi, 0.8165 mm. Ha a „becsült átlag standard hibáját”, 0.4082 mm.

## Plusz: robusztus ellenőrzés
Egy extrém hibás pont a mean és std értékét is torzíthatja. MAD=median(|x−median(x)|), normálmodellre skálázott robusztus becslés sR≈1.4826·MAD. Ez jó diagnosztika, de nem jogosít automatikus adateldobásra.

## Vizsga-buktatók
Az s és SEM összekeverése; törlés csak az egyik oszlopból; 3σ-n túli adat automatikus hibának minősítése; utóellenőrzés kihagyása; egység nélküli eredmény.
