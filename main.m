clear
clc

path = 'FingerprintImages/101_1.tif';
% path = 'testimg.png';
I = imread(path);
[~, ~, c] = size(I);
if c > 1
    I = rgb2gray(I);
end

[numRows, numCols] = size(I);

% get the mean and the variance of the img
M = mean(mean(I));
VAR = (sum(sum((double(I) - M).^2)))/((numRows*numCols)^2);

% desired mean and varaince values
VARo = 100;
Mo = 100;

% normalization of img to G
G = zeros(numRows, numCols);
index = I > M;
G(index) = Mo + sqrt(((double(I(index)) - M).^2) * (VARo/VAR));
index = I < M;
G(index) = Mo - sqrt(((double(I(index)) - M).^2) * (VARo/VAR));

% find crossing numbers CN
CN = findCN(G, 230);
[rows, cols] = find(CN == 1 | CN == 3);
indices = [rows cols];

figure, imshow(G);
% hold on
% plot(cols, rows, 'r*', 'MarkerSize', 1);

w = 8;
theta = leastSquares(G, w);

len = 4;
[r, c] = size(G);
vals = [];
for row = 1:w:r
    for col = 1:w:c
        y = row / 2;
        x = col / 2;
        
        t = theta(ceil(row / w), ceil(col / w));
        
        u = sqrt(len ^ 2 / (1 + tan(t) ^ 2));
        v = tan(t) * u;
        
        vals = [vals; x y u v];
    end
end

figure, quiver(vals(:, 1), vals(:, 2), vals(:, 3), vals(:, 4));


num = size(indices, 1);
m = struct('xy', cell(1, num), 'theta', 0, 't', 0);
% m = struct(cell(3, num));
for i = 1:num
    idx = indices(i, :);

    mn.xy = idx;
%     mn.theta = theta(idx(1), idx(2));
    mn.theta = 0;
    mn.t = CN(idx(1), idx(2));
    
    m(i) = mn;
end

x = 0;





