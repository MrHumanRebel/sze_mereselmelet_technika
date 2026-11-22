% Egyenletes eloszlások összegének standardizált alakja közelít a normálhoz.
clearvars;close all;clc;
rng(7);n=20000;k=12;
U=rand(n,k);s=sum(U,2);
z=(s-k/2)/sqrt(k/12);
fprintf('Uniform(0,1): mu=0.5, sigma=1/sqrt(12).\n');
fprintf('Standardizált összegből becsült mu=%.4f, szórás=%.4f\n',mean(z),std(z));
figure;histogram(z,70,'Normalization','pdf');hold on;
xx=linspace(-4,4,400);plot(xx,exp(-xx.^2/2)/sqrt(2*pi),'LineWidth',2);
grid on;legend('12 uniform összege','N(0,1)');
xlabel('Standardizált összeg z');ylabel('Sűrűség');
