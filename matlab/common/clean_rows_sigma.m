function [Y,keep,removed] = clean_rows_sigma(X,k)
% Többváltozós, iteratív sigma-ellenőrzés teljes minta-sorokkal.
% X: soronként egy összetartozó mérési objektum; oszloponként egy mért jellemző.
% k: 3 rövid adatsorra; nagy n esetén gyakran 4 indokolt (ld. oktatói csőpélda).
% Y megtartja a változók párosítását. Nem bizonyítja, hogy a kiszűrt adat hibás!
if nargin < 2, k = 3; end
validateattributes(X, {'numeric'}, {'2d','real','finite','nonempty'});
validateattributes(k, {'numeric'}, {'scalar','positive','finite'});
if size(X,1)<3, error('Legalább 3 mérési sor szükséges.'); end
keep=true(size(X,1),1);
for iter=1:size(X,1)
    current=X(keep,:);
    if size(current,1)<3, break; end
    mu=mean(current,1);
    sd=std(current,0,1);
    delta=abs(bsxfun(@minus,current,mu));
    limit=k*sd;
    % Zérus szórás esetén a változó állandó; nem osztunk nullával.
    bad=any(bsxfun(@gt,delta,limit),2);
    if ~any(bad), break; end
    if sum(~bad)<3
        warning('Túl kevés pont maradna: az iterációt leállítom.');
        break;
    end
    idx=find(keep);
    keep(idx(bad))=false;
end
removed=find(~keep);
Y=X(keep,:);
end
