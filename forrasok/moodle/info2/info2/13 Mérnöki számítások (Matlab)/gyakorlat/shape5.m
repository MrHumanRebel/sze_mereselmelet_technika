function [ ys ] = shape5( y )

ys = y; 
for k=3:size(y)-2
    ys(k)=sum(y(k-2:k+2))/5;
end
end


