R1=normrnd(10,1,1,1000); %letrehozunk egy 10 varhato erteku, 1-es szorasu normalis eloszlasu 1x1000 elemszamu sorvektort
% a pontosvesszovel elnyomjuk a kijelzore valo megjelenitest, ha elhagynank
% akkor teleirna a Command Window-t
figure(1) %nyitunk egy uj abrat
hist(R1,30) %az R1 valtozonknak kirajzoltatjuk a hisztogramjat, a hist parancs
%hasznalatarol, ha tobbet szeretnenk tudni, akkor: help hist
histfit(R1,[],'normal'); %az R1 hisztogramjara illesztunk egy normal eloszlast
title('Normál eloszlás') %cimet adunk az abranknak

R2=poissrnd(5,1,1000); %letrehozunk egy 5 parameteru 1*1000 meretu veletlen Poisson eloszlasu elemeket
figure(2)
hist(R2,10)
histfit(R2,[],'poisson');
title('Poisson eloszlás')

R3=unifrnd(10,25,1,1000); %letrehozunk egy 1x1000 meretu sorvektort 10 es 25 kozotti egyenletes eloszlasbol szarmazo veletlen szamokkal
figure(3)
hist(R3,20)
title('Egyenletes eloszlás')

disttool %meg lehet tekinteni kulonbozo eloszlasu valvaltozok eloszlas es suruseg fuggvenyeit

prob_between=normcdf(1)-normcdf(-1) %mekkora valoszinuseggel lesznek a standardizalt normal eloszlas
%ertekei a varhato ertek +-1 szigman belul 