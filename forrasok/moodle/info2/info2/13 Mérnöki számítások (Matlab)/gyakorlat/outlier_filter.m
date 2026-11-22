function [ xf,yf,ysf ] = outlier_filter( x,y,ys,limit )
xf=[]; yf=[]; ysf=[];
for k = 1:length(x)
    if (abs(y(k)-ys(k))<limit)
        xf=[xf x(k)];
        yf=[yf y(k)];
		ysf=[ysf ys(k)];
    end
end
end