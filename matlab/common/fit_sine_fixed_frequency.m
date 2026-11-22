function r=fit_sine_fixed_frequency(t,y,f)
% y(t)=a*sin(2*pi*f*t)+b*cos(2*pi*f*t)+offset+error.
% Amplitúdó és fázis OLS-ből, a/b kovarianciából hibaterjedéssel.
% f KÍVÜLRŐL megadott fix frekvencia; a frekvencia hibáját nem becsüli.
t=double(t(:));y=double(y(:));
if numel(t)~=numel(y)||numel(t)<5||any(~isfinite(t))||any(~isfinite(y))
    error('Azonos hosszúságú, legalább 5 véges t és y kell.');
end
if ~isscalar(f)||~isfinite(f)||f<=0,error('f legyen pozitív.');end
w=2*pi*f;
X=[sin(w*t),cos(w*t),ones(numel(t),1)];
if rank(X)<3,error('Nem azonosítható: rossz mintavétel/frekvencia.');end
b=X\y;res=y-X*b;
covB=(res'*res)/(numel(y)-3)*((X'*X)\eye(3));
amp=hypot(b(1),b(2));phase=atan2(b(2),b(1));
if amp<=eps
    uAmp=NaN;uPhase=NaN;
else
    Ja=[b(1)/amp,b(2)/amp,0];
    Jphi=[-b(2)/amp^2,b(1)/amp^2,0];
    uAmp=sqrt(max(0,Ja*covB*Ja'));
    uPhase=sqrt(max(0,Jphi*covB*Jphi'));
end
r.frequency=f;r.amplitude=amp;r.uAmplitude=uAmp;
r.phase_rad=phase;r.uPhase_rad=uPhase;
r.offset=b(3);r.uOffset=sqrt(max(0,covB(3,3)));
r.fit=X*b;r.residual=res;r.cov=covB;
end
