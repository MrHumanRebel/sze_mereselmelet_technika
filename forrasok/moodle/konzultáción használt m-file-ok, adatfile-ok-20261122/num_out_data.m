clear all
close all

N_data=2000;                    %mért adatok száma

x=(3:0.01:5);
y=ones(length(x));

P_out_gauss=1-normcdf(x);

out_data_num=N_data*P_out_gauss;

figure()
plot(x,out_data_num,'b-','LineWidth',2)
xlabel('n - szórás n-szerese')
ylabel('n-szeres szóráson kívüli, véletlen adatpontok várható száma')
grid on
hold on
plot(x,y,'r-','LineWidth',3)