function theta = leastSquares(I, w)
    [r, c] = size(I);
    theta = zeros([r c]);

    [dx, dy] = gradient(double(I));
    [dx2, ~] = gradient(dx);
    [~, dy2] = gradient(dy);

    for i = 1:r
        for j = 1:c
            w2 = 0.5 * w;

            startI = i - w2;
            if startI < 1
                startI = 1;
            end

            endI = i + w2;
            if endI > r
                endI = r;
            end

            startJ = j - w2;
            if startJ < 1
                startJ = 1;
            end

            endJ = j + w2;
            if endJ > c
                endJ = c;
            end

            theta(i, j) = estimateTheta(startI, endI, startJ, endJ, dx, dy, dx2, dy2);
        end
    end
end

function theta = estimateTheta(startI, endI, startJ, endJ, dx, dy, dx2, dy2)
    vx = 0;
    vy = 0;
    for u = startI:endI
        sumVx = 0;
        sumVy = 0;
        for v = startJ:endJ
            sumVx = sumVx + (2 * dx(u, v) * dy(u, v));
            sumVy = sumVy + (dx2(u, v) * dy2(u, v));
        end
        vx = vx + sumVx;
        vy = vy + sumVy;
    end
    
    
    if vx ~= 0
        theta = 0.5 * atan(vy / vx);
    else
        theta = 0.5 * atan(0);
    end
end






