% az autokorrelacios fuggveny mukodesehez irt peldaprogram
clear all
close all

y = [0 0 0 1 2 3 4 3 2 1 0 0 0 0 0 0 0 0 0 0 0 0 1 2 3 2 1 0 0 0 ]; %egy egyszeru ket csucsbol allo jelet hozok letre

    plot(y,'*')
    hold on
    plot(y)         %a jel megtekintese
    ylim([-1 5]);
    hold off

atlag = mean(y);
szorasnegyzet = var(y); % lehetne igy is irni: (std(y))^2
n = length(y); %kiszamolom az adatsor hosszat
r = zeros(1,n); %ez a sor opcionalis: egy "n" hosszu sorvektort hozok letre csupa nulla elemekbol,
%csak lefoglalom a memoriateruletet az r valtozonak, kesobb ugyis felulirom.

%definicio alapjan kiszamolom az osszes eltolasra az autokorrelacios
%egyutthatokat, definicio innen: https://atsa-es.github.io/atsa-labs/sec-tslab-correlation-within-and-among-time-series.html
for k=1:n
    for i=1:n-k
        r(k)=r(k)+(y(i)-atlag)*(y(i+k)-atlag);
    end
    r(k)=r(k)/szorasnegyzet/n; %esetleg (n-k)-val valo osztas
end

plot(r,'r*') % kirajzolom a kapott korrelacios egyutthatokat az eltolas fuggvenyeben

%ellenorzes a tanultak alapjan:
[ACF,tau]=xcorr(y,y);
figure(2)  %uj ablak nyitasa
plot(tau,ACF)

%esetleg egy masik beepitett fuggvennyel:
%autocorr(y,29) %a matlab beepitett autocorr fuggvenyevel is kiszamolom, es orulok, hogy ugyanaz jott ki, mint ami a definiciobol is kovetkezett

