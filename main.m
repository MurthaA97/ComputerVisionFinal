clear
clc

% path = 'FingerprintImages/101_1.tif';
path = 'testimg.png';
I = imread(path);
[~, ~, c] = size(I);
if c > 1
    I = rgb2gray(I);
end

CN = findCN(I, 230);
[rows, cols] = find(CN == 1 | CN == 3);
indices = [rows cols];

% figure, imshow(I);
% hold on
% plot(cols, rows, 'r*', 'MarkerSize', 1);

theta = leastSquares(I, 16);
theta = imfilter(theta, fspecial('gaussian', [3 3]));

u = unique(theta);

num = size(indices, 1);
m = struct('xy', cell(1, num), 'theta', 0, 't', 0);
% m = struct(cell(3, num));
for i = 1:num
    idx = indices(i, :);

    mn.xy = idx;
    mn.theta = theta(idx(1), idx(2));
    mn.t = CN(idx(1), idx(2));
    
    m(i) = mn;
end

x = 0;





