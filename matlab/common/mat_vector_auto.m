function [x,varName]=mat_vector_auto(filename,preferredNames)
% Forrásból hiányzó/bárhogy nevezett, de EGYÉRTELMŰ mérési vektor betöltése.
% Több lehetséges vektor esetén inkább hibát adunk, ne találjunk ki változót.
if nargin<2,preferredNames={'d','D','atmero','atmero_mm','diameter','csapagygolyo_atmero'};end
if ~isfile(filename),error('Hiányzik a mérési fájl: %s',filename);end
S=load(filename);
f=fieldnames(S);candidates={};
for j=1:numel(f)
  v=S.(f{j});
  if isnumeric(v)&&isvector(v)&&numel(v)>=3
    candidates{end+1}=f{j}; %#ok<AGROW>
  end
end
chosen={};
for j=1:numel(preferredNames)
 if ismember(preferredNames{j},candidates),chosen{end+1}=preferredNames{j};end %#ok<AGROW>
end
if numel(chosen)==1
    varName=chosen{1};
elseif isempty(chosen)&&numel(candidates)==1
    varName=candidates{1};
else
    error('Nem egyértelmű MAT-változó; nézd meg: whos(''-file'',''%s'')',filename);
end
x=double(S.(varName)(:));
if any(~isfinite(x)),error('Nem minden mért adat véges.');end
end
