clear all
d=10;       %diameter in mm
sigma_d=0.5; %scatter of diameter in mm
m=5;        %mass in g
sigma_m=0.1; %scatter of mass in g

rho_0=m/((1/6)*pi*d^3);  %density in g/mm^3

dd=0.001;    %decrease it for better partial derivative estimate
dm=0.01;    %decrease it for better partial derivative estimate

rho_dd=m/((1/6)*pi*(d+dd)^3);
rho_deriv_d=(rho_dd-rho_0)/dd;

rho_dm=(m+dm)/((1/6)*pi*d^3);
rho_deriv_m=(rho_dm-rho_0)/dm;

sigma_rho=sqrt(rho_deriv_d^2*sigma_d^2+rho_deriv_m^2*sigma_m^2);

