function s = measurement_stats(x)
% Egyedi szórás és közép standard hibája külön!
x=double(x(:));
if numel(x)<2 || any(~isfinite(x))
    error('Legalább két véges adat szükséges.');
end
s.n=numel(x);
s.mean=mean(x);
s.std=std(x,0);           % n-1 normalizálás
s.sem=s.std/sqrt(s.n);    % csak független adatoknál
s.min=min(x);
s.max=max(x);
end
