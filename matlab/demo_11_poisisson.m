% Poisson ritka eseményszám: generálás alap-MATLAB-ban.
clearvars;close all;clc;
rng(21);lambda=4;N=5000;x=zeros(N,1);
% Knuth-algoritmus: P(X=k)=exp(-lambda)*lambda^k/k!.
for i=1:N
 L=exp(-lambda);prodU=1;k=0;
 while prodU>L
  k=k+1;prodU=prodU*rand();
 end
 x(i)=k-1;
end
fprintf('Poisson λ=%.1f, elméleti E=%.1f, sigma=%.4f\n',lambda,lambda,sqrt(lambda));
fprintf('Mintaátlag=%.4f, szórás=%.4f\n',mean(x),std(x));
figure;histogram(x,'BinMethod','integers');grid on;
xlabel('Esemény darabszám');ylabel('Gyakoriság');
