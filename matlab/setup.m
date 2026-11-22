% MATLAB munkakörnyezet az egész repóhoz.
% A MATLAB Current Folder legyen a repo matlab könyvtára.
root = fileparts(mfilename('fullpath'));
addpath(root);
addpath(fullfile(root,'common'));
addpath(fullfile(root,'peldatar'));
addpath(fullfile(root,'adatok')); % a megosztott eredeti MAT/WAV források
fprintf('Méréselmélet: útvonalak beállítva. Gyökér: %s\n',root);
