function out = echo_delay_local(sent,received,fs,soundSpeed)
% Két jel keresztkorrelációja FFT-vel: hosszú (50–90 ezer mintás) adatokra is.
% conv(a, flipud(b)) matematikailag megegyezik a real xcorr(a,b) teljes alakjával.
a=double(sent(:)); b=double(received(:));
if numel(a)<2 || numel(b)<2 || any(~isfinite(a)) || any(~isfinite(b))
    error('Legalább két véges minta kell mindkét jelből.');
end
if fs<=0 || soundSpeed<=0, error('Pozitív fs és terjedési sebesség kell.'); end
a=detrend(a);b=detrend(b);
nfull=numel(a)+numel(b)-1;
nfft=2^nextpow2(nfull);
c=real(ifft(fft(a,nfft).*fft(flipud(b),nfft)));
c=c(1:nfull);
lags=(-(numel(b)-1):(numel(a)-1))';
[~,ii]=max(abs(c));
out.lags=lags;out.correlation=c;
out.lag_samples=lags(ii);
out.delay_seconds=abs(lags(ii))/fs;
out.distance_m=soundSpeed*out.delay_seconds/2;
out.peak_index=ii;
out.fs=fs;out.speed=soundSpeed;
% A csúcslokalizáció bizonytalanságát külön kell becsülni. Eredmény önmagában
% nem garantál standard bizonytalanságot, és a korreláció előjele jel-sorrendfüggő.
end
