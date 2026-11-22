% ÚJ SEGÉDFÜGGVÉNYEK ÖNELLENŐRZÉSE – alap-MATLAB, adatfájl nélkül.
% Futtatás: MATLAB Current Folder = matlab; run('run_extended_tests.m').
clearvars;close all;clc;setup;
% 1. ACF: pontos 5 Hz-es jel, fs=100 Hz -> T=20 minta.
fs=100;t=(0:999)'/fs;x=sin(2*pi*5*t);
[lags,ac]=acf_fft_local(x,100,false);
assert(lags(21)==20 && ac(21)>.97);
fprintf('[PASS] FFT-autokorreláció és 20 mintás periódus\n');
% 2. Az ismert frekvenciás szinusz OLS paraméterei.
trueA=2.2;truePhi=.45;f=5;
y=1+trueA*sin(2*pi*f*t+truePhi);
q=fit_sine_fixed_frequency(t,y,f);
assert(abs(q.amplitude-trueA)<1e-9);
assert(abs(q.phase_rad-truePhi)<1e-9);
assert(abs(q.offset-1)<1e-9);
fprintf('[PASS] szinusz amplitúdó/fázis/offset\n');
% 3. Súlyozott egyenes, hibátlan adaton.
xx=(0:10)';yy=2*xx+1;sigma=.1*ones(size(xx));
w=weighted_fit_line(xx,yy,sigma);
assert(abs(w.m-2)<1e-10&&abs(w.b-1)<1e-10&&w.reducedChi2<1e-12);
fprintf('[PASS] súlyozott egyenes\n');
% 4. Ismétlődő párok mediánja, majd minden x-hez z maximum.
input=[1 2 10;1 2 14;1 3 9;2 4 15;2 4 25;2 5 17];
grouped=group_median_pairs(input);
assert(isequal(grouped,[1 2 12;1 3 9;2 4 20;2 5 17]));
opt=max_per_first_column(grouped);
assert(isequal(opt,[1 2 12;2 4 20]));
fprintf('[PASS] ipari motor csoportmedián és optimum\n');
% 5. MAD: robusztus outlier.
[bad,med,sr]=mad_outlier_indices([10;10;10;10;100],3.5);
assert(isequal(find(bad),5) && med==10 && sr==0);
fprintf('[PASS] robusztus MAD\n');
% 6. Jacobian és kovarianciás hibaterjedés.
fun=@(v)v(1)*v(2);
J=central_jacobian(fun,[3;4]);
assert(norm(J-[4,3])<1e-7);
C=diag([.1^2,.2^2]);
u=uncertainty_linear(J,C);
assert(abs(u-sqrt((4*.1)^2+(3*.2)^2))<1e-7);
fprintf('[PASS] központi differencia és kovarianciás hibaterjedés\n');
% 7. MAT file betöltése mező alapján; saját temp tesztadat.
fname=[tempname,'.mat'];
d=[1;2;3];save(fname,'d');
[got,name]=mat_vector_auto(fname);
delete(fname);
assert(strcmp(name,'d') && isequal(got,[1;2;3]));
fprintf('[PASS] MAT-változó felismerése\n');
% 8. CCF peak-jelöltek: impulzus 20 mintás késéssel.
a=zeros(100,1);a(10)=1;
b=zeros(100,1);b(30)=1;
out=echo_delay_local(a,b,1000,340,1);
cand=echo_peak_candidates(out,5,5);
assert(~isempty(cand) && any(abs(cand(:,1))==20));
fprintf('[PASS] visszhang jelölt csúcsok\n');
fprintf('EXTRA SMOKE TESZTEK: MIND PASS (a valós adatok ellenőrzése külön).\n');
