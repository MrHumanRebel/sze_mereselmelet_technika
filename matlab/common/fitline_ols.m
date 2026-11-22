function r = fitline_ols(x,y)
% y = m*x + b (OLS), szórás, kovariancia, r és R².
% Nincs szükség Statistics Toolboxra.
x=double(x(:));y=double(y(:));
n=numel(x);
if n~=numel(y) || n<3 || any(~isfinite(x)) || any(~isfinite(y))
    error('Azonos hosszúságú, véges x/y és legalább 3 pont kell.');
end
X=[x,ones(n,1)];
if rank(X)<2, error('A független változó nem változik.'); end
beta=X\y;
res=y-X*beta;
s2=(res'*res)/(n-2);
covBeta=s2*((X'*X)\eye(2));
r.m=beta(1);r.b=beta(2);r.yhat=X*beta;
r.residual=res;r.cov=covBeta;
r.um=sqrt(max(0,covBeta(1,1)));
r.ub=sqrt(max(0,covBeta(2,2)));
r.cov_mb=covBeta(1,2);
r.sigma_res=sqrt(s2);
total=sum((y-mean(y)).^2);
if total==0, r.R2=NaN; else, r.R2=1-(res'*res)/total; end
cc=corrcoef(x,y);
if numel(cc)>=4, r.pearson=cc(1,2); else, r.pearson=NaN; end
end
