function [estimates, model] = fitc(xdata, ydata)
% Call fminsearch with starting point.
start_point = [-1, 0.5, 1, 0.2, 0.4];  % saját alkalmas kezdõpontok A,b,c,d,e -re
model = @expfunc;  % itt tesszük hozzáférhetõvé a modelfüggvényt
estimates = fminsearch(model, start_point);
% expfunc accepts curve parameters as inputs, and outputs sse,
% the sum of squares error for 
% A*exp(-b*(xdata-c) + d*xdata + e  
% and the FittedCurve. FMINSEARCH only needs sse, but we want
% to plot the FittedCurve at the end.
    function [sse, FittedCurve] = expfunc(params)
        A = params(1);	% 1. paraméter
        b = params(2); 	% 2. paraméter
        c = params(3); 	% 3. paraméter
        d = params(4); 	% 4. paraméter
        e = params(5); 	% 5. paraméter
        FittedCurve = A.*exp(-(b * xdata-c))+d*xdata+e;  % a függvény definíciója
        ErrorVector = FittedCurve - ydata;
        sse = sum(ErrorVector .^ 2);
    end
end
