L=[102,103,105,101,102,104,105,102,104] %eloadas diasoraban levo feladat adatai
avgL=mean(L) %atlag kiszamolasa a mean paranccsal
atlag_szorasnegyzete=sum((L-avgL).^2)/(length(L)*(length(L)-1)) %atlag szorasnegyzetenek
%definicio alapjan levo kiszamitana /length(L)-L vektor hosszanak szamitasa/
atlag_szorasa=sqrt(atlag_szorasnegyzete) %gyokvonas utan az atlag szorasa /sqrt()-gyokvonas/

atlag_szorasa_2=std(L)/sqrt(length(L)) %atlag szorasanak matlab-beli paranccsal valo szamitasa