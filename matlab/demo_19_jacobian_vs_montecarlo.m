% Közvetett mérés: analitikus és numerikus Jacobian + Monte Carlo kontroll.
clearvars;close all;clc;setup;
rho=@(v)v(1)/(v(2)*v(3)*v(4)); % m/(abc), itt egységek: g/cm³
x=[48;2;3;4];sigma=[1;.1;.1;.1];
analytic=[1/prod(x(2:4));-rho(x)/x(2);-rho(x)/x(3);-rho(x)/x(4)];
numeric=central_jacobian(rho,x);
C=diag(sigma.^2);
uAna=uncertainty_linear(analytic,C);
uNum=uncertainty_linear(numeric,C);
fprintf('Sűrűség %.4f g/cm3, u(analitikus)=%.5f, u(numerikus)=%.5f\n',rho(x),uAna,uNum);
rng(19);N=100000;
X=bsxfun(@plus,x',bsxfun(@times,randn(N,4),sigma'));
y=X(:,1)./(X(:,2).*X(:,3).*X(:,4));
fprintf('MC s=%.5f g/cm3; nagyobb bizonytalanság esetén a nemlinearitás látszik.\n',std(y));
figure;histogram(y,60);grid on;xlabel('ρ [g/cm3]');ylabel('Gyakoriság');
