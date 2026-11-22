close all
clear all

t = 0:0.5:50; %letrehozom az idosavot: 0s-tol 50s-ig 0.5s-os lepeskozzel

x = 3*sin(t) + (0.4*t+8); %egy sima szinuszos jel es egy egyenes osszege
zaj = -2+4*rand(1,length(t)); %zaj generalasa: -1 es +1 kozotti egyenletes eloszlasu veletlan szamok

jel= x+zaj; %szimulalt "mert" jel

y = detrend(jel); %linearis trend kiszamitasa es levonasa a jelbol

plot(t,jel,t,y,t,jel-y,':k') %abrazolas egy plot-ban
legend('mert jel','"detrend"-elt jel','Trend','Location','northwest') %feliratok