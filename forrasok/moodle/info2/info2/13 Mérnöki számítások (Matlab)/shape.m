function [ys] = shape(y,limit)
  % 5-pontos csúszóátlag képzés
  ys=y;
  for k=3:length(y)-2
     ys(k)=sum(y(k-2:k+2))/5;
  end
end
