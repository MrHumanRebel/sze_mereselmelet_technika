function [flag,medianValue,madScaled] = mad_outlier_indices(x,threshold)
% ROBUSZTUS DIAGNOSZTIKA, NEM automatikus adateldobási engedély.
% Normal-konzisztens sR=1.4826*median(abs(x-median(x))).
x=double(x(:));
if nargin<2,threshold=3.5;end
if numel(x)<3||any(~isfinite(x))||threshold<=0
    error('Legalább 3 véges mérés és pozitív küszöb kell.');
end
medianValue=median(x);
madScaled=1.4826*median(abs(x-medianValue));
if madScaled<eps(max(1,max(abs(x))))
    flag=abs(x-medianValue)>0;
else
    flag=abs(x-medianValue)>threshold*madScaled;
end
end
