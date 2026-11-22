function u=uncertainty_linear(J,C)
% u = sqrt(J * C * J'); GUM elsőrendű kovarianciás hibaterjedés.
J=double(J(:)'); C=double(C);
if ~isequal(size(C),[numel(J),numel(J)])||any(~isfinite(C(:)))
    error('Kovarianciamátrix dimenziója/értéke hibás.');
end
if norm(C-C','fro')>1e-8*max(1,norm(C,'fro'))
    error('Kovarianciamátrix nem szimmetrikus.');
end
v=real(J*C*J');
if v< -1e-8*max(1,sum(abs(C(:)))),error('Negatív becsült variancia.');end
u=sqrt(max(0,v));
end
