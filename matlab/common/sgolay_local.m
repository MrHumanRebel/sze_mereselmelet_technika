function y = sgolay_local(x,window,degree)
% Lokális polinomillesztés: egyszerű SG-jellegű simítás toolbox nélkül.
% A széleken rövidebb, eltolt ablakot alkalmazunk (nem pontos sgolayfilt-klón).
x=double(x(:));
N=numel(x);
if mod(window,2)~=1 || window<3 || degree<0 || degree>=window || N<window
    error('Páratlan ablak>=3, 0<=fok<ablak és elegendő adat kell.');
end
half=(window-1)/2;
y=zeros(N,1);
for i=1:N
    left=max(1,i-half);
    right=min(N,i+half);
    t=((left:right)'-i);
    if numel(t)<=degree
        error('Kevés pont a lokális polinomhoz.');
    end
    P=ones(numel(t),degree+1);
    for d=1:degree, P(:,d+1)=t.^d; end
    c=P\x(left:right);
    y(i)=c(1);
end
end
