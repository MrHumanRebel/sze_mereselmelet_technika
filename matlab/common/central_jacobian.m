function J=central_jacobian(fun,x)
% Numerikus Jacobian skalár kimenetű f(x) függvényre. ELLENŐRZÉSRE,
% ahol lehet, vizsgán az analitikus deriválás az előnyös.
x=double(x(:));n=numel(x);J=zeros(1,n);
if any(~isfinite(x)),error('x legyen véges.');end
for k=1:n
    h=eps^(1/3)*max(1,abs(x(k)));
    a=x;b=x;a(k)=a(k)+h;b(k)=b(k)-h;
    fa=fun(a);fb=fun(b);
    if ~isscalar(fa)||~isscalar(fb)||~isfinite(fa)||~isfinite(fb)
        error('A függvénynek véges valós skalárt kell visszaadnia.');
    end
    J(k)=(fa-fb)/(2*h);
end
end
