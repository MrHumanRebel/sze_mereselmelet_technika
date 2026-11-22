function dxdt=FLV(t,x)
    a=1; e=0.5; b=0.5; d=3; c=2.5;
	% a kimenet oszlopvektor!!
	dxdt=[a*x(1) - e*x(1).^2 - b*x(1).*x(2); ...
	      c*x(1).*x(2) - d*x(2)];
end
