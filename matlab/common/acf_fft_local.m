function [lags,acf] = acf_fft_local(x,maxLag,removeLinearTrend)
% Gyors, nemnegatív késésű autokorreláció O(N log N) művelettel.
% Normálás: R(0)=1; 'biased' jellegű, minden lag az eredeti N hossz szerint.
% lags mintában van; seconds=lags/fs. Nincs Signal Processing Toolbox.
x=double(x(:));N=numel(x);
if N<3 || any(~isfinite(x)),error('Legalább 3 véges minta kell.');end
if nargin<2 || isempty(maxLag),maxLag=N-1;end
if nargin<3,removeLinearTrend=false;end
if maxLag<0 || maxLag>=N || maxLag~=floor(maxLag),error('0<=maxLag<N egész kell.');end
if removeLinearTrend
    x=detrend(x);
else
    x=x-mean(x);
end
nfft=2^nextpow2(2*N-1);
F=fft(x,nfft);r=real(ifft(F.*conj(F)));
r=r(1:maxLag+1);
if r(1)<=eps
    warning('A jel szórása numerikusan nulla; ACF nem értelmezhető.');
    acf=NaN(size(r));
else
    acf=r/r(1);
end
lags=(0:maxLag)';
end
