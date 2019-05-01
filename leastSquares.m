function theta = leastSquares(I, w)
    [r, c] = size(I);

    [dx, dy] = gradient(double(I));
    dx2 = dx.^2;
    dy2 = dy.^2;
    
    numRows2 = r/w;
    numCols2 = c/w;
    theta = zeros([numRows2 numCols2]);

    for row = 1:numRows2
        for col = 1:numCols2
            temp1 = dx(((row-1)*w)+1:((row)*w), ((col-1)*w)+1:((col)*w));
            temp2 = dy(((row-1)*w)+1:((row)*w), ((col-1)*w)+1:((col)*w));
            temp3 = dx2(((row-1)*w)+1:((row)*w), ((col-1)*w)+1:((col)*w));
            temp4 = dy2(((row-1)*w)+1:((row)*w), ((col-1)*w)+1:((col)*w));
            Vx = sum(sum(((2 * temp1) .* temp2)));
            Vy = sum(sum((temp3 .* temp4)));
            
            theta(row, col) = 0.5 * atan(Vy / Vx);
        end
    end
    
    theta(isnan(theta)) = deg2rad(90);
    
    phie_x = cos(2 * theta);
    phie_y = sin(2 * theta);
    
    phie_x = imfilter(phie_x, fspecial('gaussian', [3 3]));
    phie_y = imfilter(phie_y, fspecial('gaussian', [3 3]));
    
    theta = rad2deg(0.5 * atan(phie_y ./ phie_x));

%     for i = 1:r
%         for j = 1:c
%             w2 = 0.5 * w;
% 
%             startI = i - w2;
%             if startI < 1
%                 startI = 1;
%             end
% 
%             endI = i + w2;
%             if endI > r
%                 endI = r;
%             end
% 
%             startJ = j - w2;
%             if startJ < 1
%                 startJ = 1;
%             end
% 
%             endJ = j + w2;
%             if endJ > c
%                 endJ = c;
%             end
% 
%             theta(i, j) = estimateTheta(startI, endI, startJ, endJ, dx, dy, dx2, dy2);
%         end
%     end
end

% function theta = estimateTheta(startI, endI, startJ, endJ, dx, dy, dx2, dy2)
%     vx = 0;
%     vy = 0;
%     for u = startI:endI
%         sumVx = 0;
%         sumVy = 0;
%         for v = startJ:endJ
%             sumVx = sumVx + (2 * dx(u, v) * dy(u, v));
%             sumVy = sumVy + (dx2(u, v) * dy2(u, v));
%         end
%         vx = vx + sumVx;
%         vy = vy + sumVy;
%     end
%     
%     
%     if vx ~= 0
%         theta = 0.5 * atan(vy / vx);
%     else
%         theta = 0.5 * atan(0);
%     end
% end






