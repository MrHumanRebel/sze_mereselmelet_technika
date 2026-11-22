function y = moving_average_local(x,window)
% Mozgóátlag élkorrekcióval, Signal Processing Toolbox nélkül.
origSize=size(x);
x=double(x(:));
if window<1 || window~=floor(window), error('Pozitív egész ablak kell.'); end
w=ones(window,1);
y=conv(x,w,'same')./conv(ones(size(x)),w,'same');
if isrow(zeros(origSize)), y=y.'; end %#ok<ISMAT>
end
