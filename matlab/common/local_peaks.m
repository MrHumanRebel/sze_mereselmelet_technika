function [idx,values] = local_peaks(x,minDistance,minHeight)
% Egyszerű, determinisztikus lokális maximum-kereső; toolbox nélkül.
% Csak belső mintákon detektál, platócsúcsot nem.
x=double(x(:)); N=numel(x);
if nargin<2, minDistance=1; end
if nargin<3, minHeight=-Inf; end
if N<3, idx=[];values=[];return;end
if minDistance<1 || minDistance~=floor(minDistance)
    error('minDistance pozitív egész.');
end
cand=find(x(2:end-1)>x(1:end-2) & x(2:end-1)>=x(3:end))+1;
cand=cand(x(cand)>=minHeight);
[~,order]=sort(x(cand),'descend');
taken=false(N,1); selected=zeros(numel(cand),1); m=0;
for q=order(:)'
    ii=cand(q);
    lo=max(1,ii-minDistance+1);hi=min(N,ii+minDistance-1);
    if ~any(taken(lo:hi))
        m=m+1;selected(m)=ii;
        taken(ii)=true;
    end
end
idx=sort(selected(1:m));values=x(idx);
end
