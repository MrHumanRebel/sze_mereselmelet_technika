function [param,szorasok,korrelacio]=lin_reg(x,y)
param=polyfit(x,y,1);
N=length(x);
S_0=(y-(param(1)*x+param(2)))*(y-(param(1)*x+param(2)))';
s=sqrt(S_0/(N-2));
szorasok(1)=s*sqrt(N/(N*(x*x')-(sum(x))^2));
szorasok(2)=s*sqrt((x*x')/(N*(x*x')-(sum(x))^2));
korrelacio=(N*(x*y')-sum(x)*sum(y))/(N*sqrt(((x-mean(x))*(x-mean(x))')*((y-mean(y))*(y-mean(y))')));