A = [1, 2; 3, 4], % B = [1 2; 3 4 5]  ez mérethibás!
b = [1 2 3 4], c = [1 : 0.1 : 1.4], d=[1:0]  % sorvektorok, üres is lehet!
d = [1; 2; 3; 4; 5], e = [1*i, -2*i, 3+i, 4-i, 5]'  % oszlopvektorok
C = [], D = [6:3]' % üres mátrixok ( 0 sor, 0 oszlop; ill. 0 sor 1 oszlop)
%--------------------------------------------------------

F = [A [10; 20]]   % merge: oszlopokkal bõvítés
G = [A; [10, 20]]  % append: sorokkal bõvítés
%--------------------------------------------------------

H(3:4, 5) = [11; 22]	% aki nem kap értéket, automatikusan 0 lesz


load Ab.csv, Ab       % egyenletrendszer 3x4-es táblázata
A = Ab(:,1:3), b = Ab(:,4)  % kiemeljük az A és b mátrixokat
x = A\b, A*x  % megoldjuk az egyenletrendszert, ellenõrzés


A = xlsread('adatok.xls')
A = xlsread('minta_kész1.xls',2,'B3:E6')
b = xlsread('minta_kész1.xls','2.feladat','G3:G6')


A = ones(4), A(2, 3) = 8 	% csak a 2. sor 3. eleme változik.
A(5, 2) = 10	% 5. sorral bõvül, nem definiált elem 0 lesz
p = 2; q = 3;  A(4, 4) = A(p, q) + 1

a = [ 4, 7, 2, 1, 8, 3], a(2:4) = 0, a([5, 6]) = [10, 20]
% több elemre értékadás egyetlen értékkel -> mind ez lesz
% több elemre több értékkel, az elemszámoknak egyezni kell!

a(1) = []	% elsõ elem törlése, 

a = [ 4; 7; 2; 1; 8; 3], a(2:4) = 0, a(5:6) = [10, 20]
% oszlopvektor esetén értékfelsorolásnál nem kell a ' jelet használni (de lehet) !

P = pascal(6), P(1:2, [5:6]) = zeros(2) % jobb felsõ sarok 2x2 része nullázódik
% P([1:2], 5:6) hivatkozás is jó!

P = pascal(6), 
P(:, 3:7) = P(:, 2:6)  % 2-6 oszlopok eltolása a 3-7 oszlopokba
P(3:7, :) = P([2:6], :)  % 2-6 sorok eltolása a 3-7 sorokba	

format short, clear i, j	% komplex egységvektorok regenerálása
z = 5*exp(j*[0:pi/4:pi]')	% 45 fokonkénti komplex számok
z =[z z*exp(i*pi)]	% merge, 180 fokkal elforgatottakkal bõvítés
z = [z; z]		% append, saját magával bõvítés

P(:, 2) = 0  % 2. oszlop nullázása
P(2, :) = []  % 2. sor törlése


A = ones(2,3), A2 = A + A, A1 = A2 - A

T = exp(i*[0:pi/3:pi]')
T1 = T'
T2 = T1.'


ones(2,3)*ones(3,4)	% összeszorozható, méret 2x4 lesz
% ones(3,2)*ones(4,3)	 hibaüzenet jön:


S = 2*ones(2,3), R = [1:3; 4:6], Q = S.*R


A = [1 2; 2 1], A_2 = A^2, A_3 = A^3, A3 = A.^3

E = eye(3), n = [0.6 0.8 0], P = E - n'*n  % projektormátrix (vetítés)
P^2, P^7 	% projektormátrix akárhányadik hatványa is P

A = [4 2 5; 1 -1 4; 4 0 2], determinans = det(A), rang = rank(A)
invA = inv(A), tort_alak = rats(invA), pinv_A = pinv(A)
E = eye(max(size(A))), 
inv_jobb_A = E/A, A*inv_jobb_A
inv_bal_A = A\E, inv_bal_A*A


x = 0:pi/6:pi, y = sin(x), 	% a 7 darab pont a sin függvénnyel
A = vander(x), A(:, [1:4]) = []	% Vandermonde mátrix utolsó 3 oszlopa
c = A\y'	% a 2-fokú regressziós polinom együtthatói
w = 0:pi/100:pi; f = polyval(c, w);	% polinom pontsorazata
plot(x,y,'or', w,f,'-')	% rajzolás



A=[5 2 1; 2 6 0; 1 0 4],  al=all(A),  an=any(A), 


true = 5	% felüldefiniálás
clear true, true	% eredeti érték elõcsalogatás és kiírás
~2014, ~0 	% a nem 0 érték tagadása: 0,  a 0 tagadása: 1
2014 && 1526,   2014 && false,    0 || 2014


eye(2), eye(2,3), eye(size(A), 'int16')  % itt A mérete: 3, 3
zeros(2), zeros(2, 3), zeros(size(A))
ones(2), ones(2, 3), ones(size(A))
fi = linspace(0 , 2*pi , 181), kor = exp(i*fi), plot(kor), axis square
x = logspace(1, 2, 51), y = log10(x), w = exp(log(10)*y)
% mérnököknek frekvenciamenethez


P6 = pascal(6)  % balról jobbra felfelé menõ átlókban a binomiális együtthatók
P6L = sym(pascal(6,1)) % a Cholesky-felbontás alsó háromszög mátrixa
P6U = P6L', P6L*P6U, inv_P6 = inv(P6U)*inv(P6L), inv_P6*P6
det(P6), det(inv_P6)


vander(1:0.5:3)  % oszlopokban a vektor pontozott hatványai


H = hilb(5), rats(H), invhilb(5), invhilb(5)*H


M4 = magic(4), sum(M4), sum(M4'), trace(M4), trace(flipud(M4))
% sorösszegek, oszlopösszegek, fõátló-összeg, antiátló-összeg egyeznek


n = 4, A = gallery('binomial',n), A*A/(2^(n-1)), B = A*2^((1-n)/2), B*B
% B egy involitórius mátrix


uniform = rand(1,6)  	% [0..1)-beli 6-elemû sorvektor
lotto = randi([1,90], 1, 5)   % lottószámok
norm = 10.0 + 2.0*randn(1,500), mean(norm), std(norm), hist(norm, 27)
% 500 elemû normális eloszlású sorvektor, 
% 10.0 várható értékkel és 2.0 szórással


X = diag(lotto), X_2 = diag(lotto,-2), Y = rand(4), v = diag(Y)', v1 = diag(Y, 1)'


A = [1:4; 5:8; 9:12; 13:16], flipdim(A, 1), flipdim(A, 2), flipud(A), fliplr(A)
rot90(A), rot90(A, 2), eredeti = rot90(A, 4)


A = [11:15; 21:25; 31:35; 41:45; 51:55]
circshift(A, 1), circshift(A, -2)   % függõleges shiftelés
circshift(A, [0 1]), circshift(A, [0 -2])  % vizszintes shiftelés


v = randi([10 99], [1 6]), [rendezett, index] = sort(v, 'descend'),  v(index)
% rendezett == v(index) !!


X = rand(6), sort(X)
