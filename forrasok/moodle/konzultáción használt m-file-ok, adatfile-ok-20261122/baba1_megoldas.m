clear all
close all

load baba1.mat
%lathato, hogy csak a tomegadatok allnak rendelkezesre ezert letre kell hoznom az idotengelyt
%mivel a feladat leirasaban az szerepel, hogy fel naponta mertek a baba tomeget, ezert letrehozom ezt:

ido=0:0.5:26.5;
%ellenorzom a Workspace ablakban, hogy ugyanolyan hosszu-e az ido vektor, mint a tomegvektor. Ha nem, korrigalom.

%plot(baba1,'*') %azert igy abrazolom, hogy a durva hibakat konnyebb legyen eszlelni

%a durva hibakat mind a tomegadatokbol, mind az idoadatokbol ki kell venni
%ha tobb durva hiba is van az adatok kozott, akkor azokat "hatulrol" kell torolni egyenkent, de lehet egyben is

baba1(49)=[];
ido(49)=[];

baba1(41)=[];
ido(41)=[];

baba1(13)=[];
ido(13)=[];

%alternativ megoldas, tobb durva hiba egy paranccsal valo torlesere
%baba1([13,41,49])=[];
%ido([13,41,49])=[];

%az elso 6 adatot torlom, mert az nem relevans, ezeket uj valtozokba mentem
baba_uj=baba1(7:51);
ido_uj=ido(7:51);

%a valtopont a ket egyenes kozott kb. a 22. meresi adatnal van, ezt szemrevetelezessel allapitom meg
%mivel nem tudjuk, hogy a 22. meresi pont melyik egyeneshez tartozik, jobb kihagyni a vizsgalatbol
%ket kulon szakaszt kulonboztetunk meg, mindegyikre egy-egy egyenest kell majd illeszteni

baba_tej=baba_uj(1:21);
ido_tej=ido_uj(1:21);

baba_tap=baba_uj(23:45);
ido_tap=ido_uj(23:45);

%ellenorzes
plot(ido_tej,baba_tej,'*')


[p_tej,sz_tej,k_tej]=lin_reg(ido_tej,baba_tej)

%anyatejes szakasz heti tomegnovekedese (7-tel kell szorozni, mert a meredekseg a napi tomegnovekedest adja meg)
7*p_tej(1)
%ennek a bizonytalansaga
7*sz_tej(1)


[p_tap,sz_tap,k_tap]=lin_reg(ido_tap,baba_tap)
%tapszeres szakasz heti tomegnovekedese
7*p_tap(1)
%ennek a bizonytalansaga
7*sz_tap(1)

%ket egyenes metszespontjanak az "x" koordinataja (levezetes papiron)
valtas=(p_tap(2)-p_tej(2))/(p_tej(1)-p_tap(1))
