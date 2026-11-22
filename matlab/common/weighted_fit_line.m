function r=weighted_fit_line(x,y,sigmaY)
% Súlyozott y=m*x+b illesztés, ha sigmaY ismert ABSZOLÚT y-std.
% Súly=1/sigmaY^2. A becsült paraméter-Cov az ismert szórásokra vonatkozik;
% ha csak relatív súlyok vannak, a Cov-ot a reziduális chi2 alapján skálázni kell.
x=double(x(:));y=double(y(:));sigmaY=double(sigmaY(:));
N=numel(x);
if N<3||numel(y)~=N||numel(sigmaY)~=N
    error('Legalább 3 azonos hosszúságú x,y,sigmaY kell.');
end
if any(~isfinite([x;y;sigmaY]))||any(sigmaY<=0)
    error('Minden adat véges és sigmaY>0 szükséges.');
end
A=[x,ones(N,1)];
As=bsxfun(@rdivide,A,sigmaY);
ys=y./sigmaY;
if rank(As)<2,error('A x értékek nem különböznek.');end
b=As\ys;
c=(As'*As)\eye(2);
res=y-A*b;
r.m=b(1);r.b=b(2);r.um=sqrt(max(0,c(1,1)));r.ub=sqrt(max(0,c(2,2)));
r.cov=c;r.residual=res;r.yhat=A*b;
r.chi2=sum((res./sigmaY).^2);r.dof=N-2;
r.reducedChi2=r.chi2/r.dof;
end
