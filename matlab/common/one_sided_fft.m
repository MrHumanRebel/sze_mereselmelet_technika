function [f,A,Y] = one_sided_fft(x,fs)
% Valós jel helyesen normált egyoldali amplitúdóspektruma.
% Az eredmény az FFT rács frekvenciáin értendő; ablakolás külön kezelendő.
x=double(x(:));
validateattributes(fs,{'numeric'},{'scalar','positive','finite'});
if numel(x)<2 || any(~isfinite(x)), error('Legalább 2 véges minta kell.'); end
N=numel(x);
Y=fft(x);
K=floor(N/2)+1;
A=abs(Y(1:K))/N;
if mod(N,2)==0
    if K>2, A(2:end-1)=2*A(2:end-1); end
else
    A(2:end)=2*A(2:end);
end
f=(0:K-1)'*(fs/N);
end
