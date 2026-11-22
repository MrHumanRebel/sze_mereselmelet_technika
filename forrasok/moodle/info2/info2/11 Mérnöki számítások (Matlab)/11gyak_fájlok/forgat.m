function [ Y ] = forgat( X, fi )
% Az X 2xn mátrix koordinátapárokat tartalmaz oszloponként
% A pontok új helyzetét adja fi szögû (fokokban mért) forgatás után
F = [cosd(fi) -sind(fi); sind(fi) cosd(fi)];
Y = F*X;
end

