function n = normalise(im,Mo,VARo)
%     if ~isa(im,'double'), im = double(im); end	
% 	im = im - mean(im(:));    
% 	im = im/std(im(:));      % Zero mean, unit std dev
% 
% 	n = Mo + im*sqrt(VARo);

[numRows, numCols] = size(im);

% get the mean and the variance of the im
M = mean(mean(im));
VAR = (sum(sum((double(im) - M).^2)))/((numRows*numCols)^2);

% desired mean and varaince values
% VARo = 100;
% Mo = 100;

% normalization of im to G
G = zeros(numRows, numCols);
index = im > M;
G(index) = Mo + sqrt(((double(im(index)) - M).^2) * (VARo/VAR));
index = im < M;
G(index) = Mo - sqrt(((double(im(index)) - M).^2) * (VARo/VAR));
n = G;
end

