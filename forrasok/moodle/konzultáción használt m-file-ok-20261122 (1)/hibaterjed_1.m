clear all
d=10;       %diameter in mm
sigma_d=0.5; %scatter in mm

V_0=(1/6)*pi*d^3;  %volume in mm^3
dd=0.001;    %decrease it for better derivative estimate
V_dd=(1/6)*pi*(d+dd)^3;

V_deriv=(V_dd-V_0)/dd;

%sigma_V=sqrt(V_deriv^2*sigma_d^2);
sigma_V=V_deriv*sigma_d

pontos_sigmaV=0.5*pi*d^2*sigma_d %papiron levezetve, a pontos derivalas erteke
