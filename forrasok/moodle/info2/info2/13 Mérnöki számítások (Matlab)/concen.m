function dxdt = conc(t,x,C,tau)
dxdt = (C-x)/tau;
end