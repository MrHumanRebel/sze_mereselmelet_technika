function [ h ] = gomb( )
% Az x^2+y^2+z^2 = 1 egyenletû gömb szférikus rajza.
% A gömb paraméteres alakra át lett írva.
% z: a harmadik dimenzió koordinátája [-1 1]
% t: az x-y síkbeli polárkoordináta [0 2*pi]
% Visszadott érték az objektummutató.
% Az x és y koordinátákat megadó karakterlácok 
% szeletekbõl összeragasztva.
% Az ezsurf 4. paraméterében a névsorban elõbb álló t
% intervallumhatárait követik a z intarvallumhatárai.
% Hívás: gomb();
hold off
s='sqrt(1-z^2)*';
h=ezsurf([s 'cos(t)'],[s 'sin(t)'],'z',[0 2*pi, -1 1]); 
axis equal
end

