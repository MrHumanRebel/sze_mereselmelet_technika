function [s]=animacio(ratio)
if round(ratio)~=ratio s='A paraméter nem egész!'; return, end
R = 1; % R a nagy kör sugara
r = R/ratio; % a gördülõ kör sugara, lehet negatív is
t=[]; % küllõ végpontja, r>0 hipociklois, r<0 epiciklois
z=R*exp(i*linspace(0,2*pi,361)); % nagy kör fokonként megadott pontokkal
w=r*exp(i*linspace(0,2*pi,361)); % kicsi kör
if (r>0) cim ='hipociklois'; s0 = R; 
else cim = 'epiciklois'; s0 = R - 2*r; end
s=s0*exp(i*linspace(0,2*pi,361)); % keret kör a méretezéshez
figure; axis square; % az ábra méretezését négyzetesre váltjuk
for k=1:length(z) % minden jelenet üres vászonra kerül
   plot(s, 'w'); % láthatatlan keret kör
   title(cim);
   hold on; plot(z, 'b' ); % nagy kör kékkel
   plot((R-r)*z(k)+w, 'r'); % a kicsi kör pirossal
   plot((R-r)*z(k), 'ok'); % a kicsi kör közepe fekete
   kullo=[(R-r)*z(k) (R-r)*z(k)+r*exp(-i*(R-r)/r*angle(z(k)))];
   plot(kullo, 'k'); % küllõ feketével
   t=[t kullo(2)]; plot(t,'g'); % bõvitjük a végpont pályáját,kirajzoljuk
   hold off; axis square;  % hogy a következõ rajz üres vászonra menjen
   pause(0.05) % késleltetés
end;
s = 'Körbeért!';
end
