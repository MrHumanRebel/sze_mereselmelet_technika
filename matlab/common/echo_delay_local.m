function out = echo_delay_local(sent,received,fs,soundSpeed)
% Küldött és visszaérkező jel korrelációja, oda-vissza távolság.
% Teljes konvolúció xcorr(x,y) matematikai megfelelője; nem toolbox-függő.
a=double(sent(:)); b=double(received(:));
if numel(a)<2 || numel(b)<2 || any(~isfinite(a)) || any(~isfinite(b))
    error('Legalább két véges minta kell mindkét jelből.');
end
if fs<=0 || soundSpeed<=0, error('Pozitív fs és terjedési sebesség kell.'); end
a=a-mean(a);b=b-mean(b);
c=conv(a,flipud(b));
lags=(-(numel(b)-1):(numel(a)-1))';
[~,ii]=max(abs(c));
lag=lags(ii);
out.lags=lags;out.correlation=c;
out.lag_samples=lag;
out.delay_seconds=abs(lag)/fs;
out.distance_m=soundSpeed*out.delay_seconds/2;
out.fs=fs;
out.speed=soundSpeed;
% A csúcslokalizáció bizonytalanságát a kiértékelő külön becsüli;
% nem állítjuk automatikusan, hogy egyetlen minta a teljes bizonytalanság.
end
