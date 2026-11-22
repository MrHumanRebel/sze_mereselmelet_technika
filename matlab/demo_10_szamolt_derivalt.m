% Analitikus vs központi differenciás érzékenység egy gömbnél.
clearvars;close all;clc;
f=@(d)pi*d.^3/6;d=10;ud=.1;
exact=pi*d^2/2;
steps=10.^(-1:-1:-10);
estimate=zeros(size(steps));
for k=1:numel(steps)
 h=steps(k);estimate(k)=(f(d+h)-f(d-h))/(2*h);
end
fprintf('Analitikus ∂V/∂d=%.9f, uV=%.9f\n',exact,exact*ud);
disp(table(steps',estimate',abs(estimate'-exact),'VariableNames',{'h','derivalt','absHiba'}));
figure;loglog(steps,abs(estimate-exact),'o-');grid on;
xlabel('Lépésköz');ylabel('Derivált abszolút eltérése');
title('Túl kicsi h esetén a kerekítési hiba nőhet');
