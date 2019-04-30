filePath = 'FingerprintImages/110_8.tif';
img = imread(filePath);
[numRows, numCols] = size(img);

% get the mean and the variance of the img
M = mean(mean(img));
VAR = (sum(sum((double(img) - M).^2)))/((numRows*numCols)^2);

% desired mean and varaince values
VARo = 100;
Mo = 100;

% normalization of img to G
G = zeros(numRows, numCols);
index = img > M;
G(index) = Mo + sqrt(((double(img(index)) - M).^2) * (VARo/VAR));
index = img < M;
G(index) = Mo - sqrt(((double(img(index)) - M).^2) * (VARo/VAR));

%%%%%Confused by the differnce in means which one is the right operator?
% mean(mean(G))
% G = uint8(G);
% mean(mean(G))
% imshow(G);

%calc image gradient
[Gx,Gy] = imgradientxy(G);
[Gx2, ~] = imgradientxy(Gx);
[~, Gy2] = imgradientxy(Gy);


w = 16;
numRows2 = numRows/w;
numCols2 = numCols/w;
Vx = zeros(numRows2, numCols2);
Vy = zeros(numRows2, numCols2);

for row = 1:numRows2
    for col = 1:numCols2
        temp1 = Gx(((row-1)*w)+1:((row)*w), ((col-1)*w)+1:((col)*w));
        temp2 = Gy(((row-1)*w)+1:((row)*w), ((col-1)*w)+1:((col)*w));
        Vx(row,col) = sum(sum(((2*temp1)+temp2)));
        Vy(row,col) = sum(sum((temp
    end
end



