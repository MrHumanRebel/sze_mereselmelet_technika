function dxdt=F(t,x)
dxdt=zeros(2,1); % a kimenet oszlopvektor!!
dxdt(1)=x(2);
dxdt(2)=-t*x(1)+exp(-t)*x(2)+3*sin(2*t);
end