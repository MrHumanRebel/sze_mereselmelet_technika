%letrehozunk 4 db adatsort, ami egyenletes eloszlasu [1,3] kozott
%forras: https://www.mathworks.com/help/matlab/ref/rand.html
clear all

a = 3;
b = 1;
% mu = 2, mivel mu = (a+b)/2
% szorasnegyzet = 1/3, mivel szigma^2 = (b-a)^2/12
n = 40;
r1 = a + (b-a).*rand(n,1);

%esetleg megtekinteni
%hist(r1)

r2 = a + (b-a).*rand(n,1);
r3 = a + (b-a).*rand(n,1);
r4 = a + (b-a).*rand(n,1);

%meg lehet nezni egyenkent a histogram-okat
% figure(), hist(r1)
% figure(), hist(r2)
% figure(), hist(r3)
% figure(), hist(r4)

osszeg = r1 + r2 + r3 + r4; % N = 4
hist(osszeg)
histfit(osszeg,[],'normal') %elmeleti hatar, ha N=vegtelen

% a centralis hatareloszlas tetele szerint az
% az osszeg ehhez a normal eloszlashoz kozelit:
% mu_osszeg = 4*mu = 4*2=8
% szorasnegyzet_osszeg = 4*szorasnegyzet = 4*1/3 = 4/3



