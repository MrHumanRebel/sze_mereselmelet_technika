function dot2dot(X)
% DOT2DOT egy 2xn méretû mátrixban adott pontokat köt össze
X(:,end+1) = X(:,1);  %  elsõ ponttal bõvítjük a mátrixot
plot(X(1,:),X(2,:),'.-','linewidth',2)  % rajzolás
axis(10*[-1 1 -1 1])
axis square
