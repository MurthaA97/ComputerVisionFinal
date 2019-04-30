function im = normalise(img,Mo,VARo)
[numRows, numCols] = size(img);

% get the mean and the variance of the img
M = mean(mean(img));
VAR = (sum(sum((double(img) - M).^2)))/((numRows*numCols)^2);

% desired mean and varaince values
% VARo = 100;
% Mo = 100;

% normalization of img to G
G = zeros(numRows, numCols);
index = img > M;
G(index) = Mo + sqrt(((double(img(index)) - M).^2) * (VARo/VAR));
index = img < M;
G(index) = Mo - sqrt(((double(img(index)) - M).^2) * (VARo/VAR));
im = G;
end

