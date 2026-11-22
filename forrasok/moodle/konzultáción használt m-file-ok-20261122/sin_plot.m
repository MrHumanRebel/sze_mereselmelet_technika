%PELDA A FUGGVENYABRAZOLASRA MATLAB KORNYEZETBEN

t=[0:0.01:10]; %a matlab nem tud fuggvegyeket abrazolni, csak ertekparokat tud osszekotni
%ezert letrehozunk egy alaphalmazt, 0 kezdettel, 0,01-es lepeskozzel, 10-ig
A=2;T=3; %beallitjuk az amplitudot 2-nek a periodusidot 3-nak
y1=A*sin((2*pi/T)*t); %az alappontok segitsegevel letrehozunk egy vektort ami eleg jo
%felbontasban adja vissza egy harmonikus rezges kitereseit az ido fuggvenyeben
y2=A*cos((2*pi/T)*t); %ez is egy rezges, csak eltolt fazisban van

figure(1)
plot(t,y1,'r-','LineWidth',3)%y1 megjelenitese t fuggvenyeben, 3-as vonalvastagsaggal
%voros folytonos vonallal osszekotve az ertekparokat
grid on %negyzethalo felrajzolasa az abrara
xlabel('Idõ [s]') %x tengely cimkezese
ylabel('Kitérés [m]')%y tengely cimkezese
title('Két harmonikus rezgés kitérés-idõ függvénye')%abra cimadasa
hold on %az abra rogzitese, mert ugyanide szeretnenk abrazolni a masik fuggvenyt is
plot(t,y2,'g-','LineWidth',3) % a kulonbseg most a zold folytonos vonal
hold off %az abrank kesz, a rogzites feloldasa

figure(2) %kettes abra nyitasa
plot(y1,y2,'m-','LineWidth',3) %magenta szinnel a ket gorbe egymas fuggvenyeben abrazolva
%azaz mintha ket egymasra meroleges rezgest adnak ossze (lasd. Lissajous-gorbek)
grid on
xlabel('Kitérés [m]')
ylabel('Kitérés [m]')
title('Két merõleges harmonikus rezgés eredõje')