function out=group_median_pairs(data)
% [x,y,z] nyers adatokból minden [x,y] párhoz egy medián(z).
% A Moodle motoros példájával azonos feladat, nincs toolbox.
if size(data,2)~=3||isempty(data)||any(~isfinite(data(:)))
    error('Nem üres, véges N×3-as mátrixot várunk.');
end
pairs=unique(data(:,1:2),'rows');
v=zeros(size(pairs,1),1);
for i=1:size(pairs,1)
    ix=data(:,1)==pairs(i,1)&data(:,2)==pairs(i,2);
    v(i)=median(data(ix,3));
end
out=[pairs,v];
end
