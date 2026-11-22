function out=max_per_first_column(data)
% Minden különböző x (1. oszlop) mellé a z maximumhoz tartozó y-t adja.
% Döntetlen esetben az első előforduló max-ot tartja meg.
if size(data,2)~=3||isempty(data)||any(~isfinite(data(:)))
    error('Nem üres, véges N×3-as mátrixot várunk.');
end
xunique=unique(data(:,1));
out=zeros(numel(xunique),3);
for i=1:numel(xunique)
    chunk=data(data(:,1)==xunique(i),:);
    [~,ind]=max(chunk(:,3));
    out(i,:)=chunk(ind,:);
end
end
