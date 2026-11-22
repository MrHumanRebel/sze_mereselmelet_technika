function r = spectra_welch_local(x,y,fs,segmentLength)
% Egyoldali PSD, CSD és nagyság-négyzetes koherencia.
% Hann-ablak, 50% átfedés, periodogramok átlaga, nincs toolbox.
x=double(x(:));y=double(y(:));
if numel(x)~=numel(y) || numel(x)<8 || fs<=0
    error('Azonos hosszúságú, legalább 8 pontos jelpár és fs>0 kell.');
end
if nargin<4, segmentLength=min(256,numel(x)); end
M=segmentLength;
if M<8 || M>numel(x) || M~=floor(M), error('Érvénytelen ablakméret.'); end
step=max(1,floor(M/2)); half=floor(M/2)+1;
w=.5-.5*cos(2*pi*(0:M-1)'/(M-1));
normFactor=fs*sum(w.^2);
px=zeros(half,1);py=zeros(half,1);pxy=zeros(half,1);
count=0;
for left=1:step:(numel(x)-M+1)
    ix=left:left+M-1;
    xx=x(ix)-mean(x(ix)); yy=y(ix)-mean(y(ix));
    X=fft(xx.*w);Y=fft(yy.*w);
    pxx=abs(X(1:half)).^2/normFactor;
    pyy=abs(Y(1:half)).^2/normFactor;
    pxy=conj(X(1:half)).*Y(1:half)/normFactor;
    if mod(M,2)==0
        if half>2, rr=2:half-1;pxx(rr)=2*pxx(rr);pyy(rr)=2*pyy(rr);pxy(rr)=2*pxy(rr);end
    else
        rr=2:half;pxx(rr)=2*pxx(rr);pyy(rr)=2*pyy(rr);pxy(rr)=2*pxy(rr);
    end
    px=px+pxx;py=py+pyy;pxy=pxy+pxy;count=count+1;
end
r.f=(0:half-1)'*fs/M;
r.Pxx=px/count;r.Pyy=py/count;r.Pxy=pxy/count;
r.coherence=abs(r.Pxy).^2./max(r.Pxx.*r.Pyy,realmin);
r.segments=count;
r.df=fs/M;
end
