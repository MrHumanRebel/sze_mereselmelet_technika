%oran bemutatott pelda kulonbozo simitasi tehnikakrol:
%https://web.archive.org/web/20220319172140/http://195.134.76.37/applets/AppletSmooth/Appl_Smooth2.html

close all
clear all

%az alabbi bemeno parametereket erdemes allitgatni
Z = 0.3; %zaj nagysaga (kicsi:0.1-nagy:3)
N_simit = 10; %simitasok szama (1-15 ajanlott)
szuro_szelesseg = 11; %mozgo atlag vagy SG "ablak" merete, legyen paratlan szam!
SG_fokszam = 3; %Savitzky-Golay: illesztett polimon fokszáma

%alapjelek letrehozasa
    t = 1:2000;
    alap = zeros(1,2000);
    jel1 = 10*exp(-(((t-200).^2)/(2*60.^2)));
    jel2 = 4*exp(-(((t-360).^2)/(2*20.^2)));
    jel3 = 700./((t-700).^2+100);
    alap(950:1050) = 3;
    alap(1250:1550) = 7;
    alap(1551:1750) = 4;
    alap(1751:1850) = 1;
    jel = jel1+jel2+jel3+alap;

    zaj= Z*randn(1,length(t)); %normal eloszlasu zaj letrehozasa

plot(t,jel+zaj,'r',t,jel) %az idealis jel es a zajos jel megtekintese egy ablakban (a zajos jel a piros)
title('simitatlan jel');

mozgo_atlagolt_jel = jel+zaj; %ez a ket sor csak a for ciklus miatt kellett
SG_atlagolt_jel = jel+zaj;

for i = 1:N_simit
    
   mozgo_atlagolt_jel = smooth(mozgo_atlagolt_jel,szuro_szelesseg);
   SG_atlagolt_jel = smooth(SG_atlagolt_jel,szuro_szelesseg,'sgolay',SG_fokszam);
    
end

figure(2)
plot(t,jel,t,mozgo_atlagolt_jel,'k') %mozgo atlagolt jel es az eredeti jel megtekintese (atlagolt jel a fekete)
title('mozgo atlaggal simitott jel'); %cim hozzaadasa

figure(3)
plot(t,jel,t,SG_atlagolt_jel,'k') %Savitzky-Golay szurovel atlagol jel es az eredeti jel megtekintese (atlagolt jel a fekete)
title('savitzky-golay atlaggal simitott jel'); %cim hozzaadasa
