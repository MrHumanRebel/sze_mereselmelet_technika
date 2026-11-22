
format compact
%-----------------------------

help sqrt
doc sqrt
%-----------------------------

A = [4 2 0; -3 5 2; -2 6 1], b=[10;-10;-10], det(A), x=A\b, A*x
%-----------------------------

clear, syms a b c x;  f = a*exp(-b*x)*sin(c*x)
% A meglévõ változók törlése, szimbolikus változók definiálása 
int_f = int(f,x) 	% primitív függvény
diff_int = diff(int_f,x)		% ennek deriváltja
% Itt még nem kaptuk vissza az eredeti függvényt (ez az alak jóval bonyolultabb),
% ezért "kényszerített" egyszerûsítéssel folytatjuk
egyszerubb = simple(diff_int); % egyszerûbb alakra
egyszerubb		% egyszerûbb alak kiíratása
%-----------------------------

ezplot('(x^2+y^2)^2-x^2+y^2',[-1,1],[-1,1]); axis square
%-----------------------------

animacio(5)     
%-----------------------------

intmax('uint64')
q = uint16(40000), q+q
 v = 1e155, v2 = v*v, v3 = v2/v2, v4 = v2*0, v5 = v2-v2
%-----------------------------

z=4+3i, R = abs(z), z*z', fi = angle(z)
R*exp(i*fi)
R*cos(fi) + i*(R*sin(fi))
a = -7 + 22i, b = 2 + 3i, c = a/b
%-----------------------------

st = 'alma', ujst = st + 1, uint8(st)
ascii = char(32:127)
kod = uint16(ascii)    % double(ascii) is jó

ekezetes = 'öüóõúéáûíÖÜÓÕÚÉÁÛÍ'
whos ekezetes
novekvo = sort(ekezetes)
novekvokod = uint16(novekvo)
%-----------------------------

B = [1 2 3; 4 5 6; 7 8 9], C =[1, 2, 3; 4, 5, 6; 7, 8, 9]
whos B, C
C == B
%-----------------------------

'Matlab' == 'Matek '
%-----------------------------

B = true(2, 3), whos B, B - ones(2,3)
%-----------------------------

most=now(), dt_str=datestr(most), dt_vec=int16(datevec(most))
int16(clock)
x=sqrt(3); tic, for i=1:10^8 x=x+1.0000001; end, toc;
x=sqrt(3); tic, for i=1:10^8 x=x/1.0000001; end, toc;
%-----------------------------

123456789, 1234567890
format long e; pi
%-------------------------

1:10,   5:2:15,   0: 0.01: 10
%-----------------------------
% értékadás
sz = 1/3 - 1/2, st = sin(pi/6), e = exp(1), e2 = exp(2), egys = log(e)
sz2 = sym('1/2')-sym('1/3')

% hasonlítások
st > sz
e2 == e*e, ell = e2 - e*e   % nem számol pontosan!!
s_pi = single(pi), s_pi == pi, kulonbs = pi - s_pi

'alma' == 'alfa'	% írásjelenként értékel
strcmp('alma', 'alMa')   % kisbetû-nagybetûre érzékeny
strcmpi('alma', 'alMa') % kisbetû-nagybetûre nem érzékeny

% mennyire pontos?
abs(sin(pi/4) - 0.5*sqrt(2)) < eps
%-----------------------------
save test.mat 
clear 
load test.mat

save e_valt.mat	e* % csak az e-vel kezdõdõ változók

% e betûvel kezdõdõ változók nevei:
who e*

% e betûvel kezdõdõ változók törlése:
clear e*

