R1=normrnd(10,1,1,1000);
figure(1)
hist(R1,30)
histfit(R1,[],'normal');
title('Normál eloszlás')

R2=poissrnd(5,1,100);
figure(2)
hist(R2,10)
histfit(R2,[],'poisson');
title('Poisson eloszlás')