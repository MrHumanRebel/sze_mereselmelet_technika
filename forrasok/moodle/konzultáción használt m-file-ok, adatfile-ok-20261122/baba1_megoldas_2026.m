clear all

load baba1.mat
%eszrevettem, hogy nincs idotengely
%letre kell hozni
%fel naponkent volt a szoveg szerint

ido=0:0.5:26.5;
%szemrevetelezem az adatokat
%plot(ido,baba1,'+')
%torles elott, csak a meresi adat sorszam szerint abrazolom
%plot(baba1,'+')
%lattam azt, hoz ezek az adatok durva meresi hibak:13.,41.,49. ezert
%kiveszem oket

% baba1(49)=[];
% baba1(41)=[];
% baba1(13)=[];

%lehet ezt egy sorban is
baba1([13,41,49])=[];
ido([13,41,49])=[];

plot(ido,baba1,'+')

%torolni kellene az elso 6 adatot
baba_uj=baba1(7:end);
ido_uj=ido(7:end);
%ha valamit valtoztatunk, akkor nezzunk ra!

plot(ido_uj,baba_uj,'+')
xlabel('Idő (nap)')
ylabel('Mérési érték')

plot(baba_uj,'+') %hogy lassam, melyik indexnel kell a vagas
baba_tej=baba_uj(1:23);
ido_tej = ido_uj(1:23);

baba_tap=baba_uj(25:end);
ido_tap=ido_uj(25:end);

%ellenorzeskepp
plot(ido_tej,baba_tej,"+")
plot(ido_tap,baba_tap,'+')

[par_tej,szor_tej, korr_tej]=lin_reg(ido_tej,baba_tej)

%valasz: a heti tomegnovekedes a tejes idoszakban: par_tej(1)*7, ennek
%bizonytalasaga szor_tej(1)*7

par_tej(1)*7
szor_tej(1)*7

[par_tap,szor_tap, korr_tap]=lin_reg(ido_tap,baba_tap)

%valasz: a heti tomegnovekedes a tapos idoszakban: par_tap(1)*7, ennek
%bizonytalasaga szor_tap(1)*7

par_tap(1)*7
szor_tap(1)*7

%papiron levo szamolas alapjan:
valtas_ideje = (par_tap(2)-par_tej(2))/(par_tej(1)-par_tap(1))