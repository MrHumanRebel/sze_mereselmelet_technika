function out = echo_delay_local(sent,received,fs,soundSpeed,smoothWidth)
% FFT-s keresztkorreláció, opcionális csúszóátlag a zajos korreláció simítására.
% Oktatói szonár példa: smoothWidth=81; 50 ezer mintán gyorsan fut.
if nargin<5, smoothWidth=1; end
a=double(sent(:));b=double(received(:));
if numel(a)<2 || numel(b)<2 || any(~isfinite(a)) || any(~isfinite(b))
    error('Legalább két véges minta kell.');
end
if fs<=0 || soundSpeed<=0 || smoothWidth<1 || smoothWidth~=floor(smoothWidth)
    error('Érvénytelen fs, sebesség vagy simító ablak.');
end
a=detrend(a);b=detrend(b);
nfull=numel(a)+numel(b)-1;nfft=2^nextpow2(nfull);
c=real(ifft(fft(a,nfft).*fft(flipud(b),nfft)));
c=c(1:nfull);
lags=(-(numel(b)-1):(numel(a)-1))';
if smoothWidth==1, cs=c;
else
    cs=conv(c,ones(smoothWidth,1)/smoothWidth,'same');
end
[~,ii]=max(abs(cs));
out.lags=lags;out.correlation=c;out.smoothed=cs;
out.lag_samples=lags(ii);
out.delay_seconds=abs(lags(ii))/fs;
out.distance_m=soundSpeed*out.delay_seconds/2;
out.peak_index=ii;out.fs=fs;out.speed=soundSpeed;
% A maximális abszolút csúcs lehet zaj miatti lokális maximum is.
% Ábrán, fizikai sorrend alapján ellenőrizni kell a választott késést.
% A csúcslokalizáció standard bizonytalanságát külön kell becsülni.
end
