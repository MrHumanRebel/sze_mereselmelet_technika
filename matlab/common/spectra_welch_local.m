function r = spectra_welch_local(x,y,fs,segmentLength)
% Welch-PSD/CSD/koherencia, Hann ablak, 50% átfedés. Alap MATLAB, toolbox nélkül.
% Csak egyenlő hosszúságú, valós, véges időjelekhez.
x=double(x(:));y=double(y(:));
if numel(x)~=numel(y) || numel(x)<8 || fs<=0 || any(~isfinite(x)) || any(~isfinite(y))
    error('Két azonos hosszúságú, >=8 véges minta és fs>0 kell.');
end
if nargin<4,segmentLength=min(256,numel(x));end
M=segmentLength;
if M<8 || M>numel(x) || M~=floor(M)
    error('Érvénytelen szegmenshossz.');
end
step=max(1,floor(M/2));K=floor(M/2)+1;
w=.5-.5*cos(2*pi*(0:M-1)'/(M-1));
denom=fs*sum(w.^2);
sumPxx=zeros(K,1);sumPyy=zeros(K,1);sumPxy=zeros(K,1);
count=0;
for left=1:step:(numel(x)-M+1)
    ix=left:left+M-1;
    xx=x(ix)-mean(x(ix));yy=y(ix)-mean(y(ix));
    X=fft(xx.*w);Y=fft(yy.*w);
    Pxx=abs(X(1:K)).^2/denom;
    Pyy=abs(Y(1:K)).^2/denom;
    Pxy=conj(X(1:K)).*Y(1:K)/denom;
    % Egyoldali spektrum: csak a belső pozitív bin-eket duplázom.
    if mod(M,2)==0
        if K>2, ii=2:K-1;
            Pxx(ii)=2*Pxx(ii);Pyy(ii)=2*Pyy(ii);Pxy(ii)=2*Pxy(ii);
        end
    else
        ii=2:K;
        Pxx(ii)=2*Pxx(ii);Pyy(ii)=2*Pyy(ii);Pxy(ii)=2*Pxy(ii);
    end
    sumPxx=sumPxx+Pxx;
    sumPyy=sumPyy+Pyy;
    sumPxy=sumPxy+Pxy;
    count=count+1;
end
r.f=(0:K-1)'*fs/M;
r.Pxx=sumPxx/count;
r.Pyy=sumPyy/count;
r.Pxy=sumPxy/count;
r.coherence=abs(r.Pxy).^2./max(r.Pxx.*r.Pyy,realmin);
% Numerikus kerekítés: -1e-15 és 1+1e-15 helyett a fizikai [0,1] tartomány.
r.coherence=max(0,min(1,real(r.coherence)));
r.segments=count;
r.df=fs/M;
end
