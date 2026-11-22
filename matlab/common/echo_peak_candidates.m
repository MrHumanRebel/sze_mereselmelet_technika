function candidates=echo_peak_candidates(out,minSepSamples,nTop)
% A CCF több lehetséges lokális csúcsának feltérképezése.
% A LAG FIZIKAI KIVÁLASZTÁSÁT A KIÉRTÉKELŐ VÉGZI, nem automatikus absmax.
if nargin<2,minSepSamples=50;end
if nargin<3,nTop=10;end
if ~isfield(out,'smoothed'),error('echo_delay_local eredmény szükséges.');end
score=abs(out.smoothed(:));
threshold=.1*max(score);
[idx,values]=local_peaks(score,minSepSamples,threshold);
[~,ord]=sort(values,'descend');
idx=idx(ord(1:min(nTop,numel(ord))));
candidates=[out.lags(idx),abs(out.lags(idx))/out.fs,...
            abs(out.lags(idx))*out.speed/(2*out.fs),out.smoothed(idx)];
% oszlopok: lag[minta], |t|[s], echo-d[m], signed CCF amplitude
end
