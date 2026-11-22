function [x,varName]=mat_vector_auto(filename,preferredNames)
% MAT-ban szereplő egyetlen mérési vektor megbízható betöltése.
if nargin<2,preferredNames={'d','D','atmero','diameter','csapagygolyo_atmero'};end
if ~isfile(filename),error('Hiányzik a fájl: %s',filename);end
S=load(filename);names=fieldnames(S);numericNames={};
for j=1:numel(names)
  v=S.(names{j});
  if isnumeric(v) && isvector(v) && numel(v)>=3
    numericNames{end+1}=names{j}; %#ok<AGROW>
  end
end
selected={};
for j=1:numel(preferredNames)
  if ismember(preferredNames{j},numericNames)
    selected{end+1}=preferredNames{j}; %#ok<AGROW>
  end
end
if numel(selected)==1
 varName=selected{1};
elseif isempty(selected) && numel(numericNames)==1
 varName=numericNames{1};
else
 error('Nem egyértelmű változó. Ellenőrizd: whos(''-file'',''%s'')',filename);
end
v=S.(varName);x=double(v(:));
if any(~isfinite(x)),error('NaN vagy Inf a mérési adatok között.');end
end
