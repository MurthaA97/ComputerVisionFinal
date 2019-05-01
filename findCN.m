function CN = findCN(img)
    CN = zeros(size(img));
    padI = padarray(img, [1 1], 1, 'both');

    [rows, cols] = size(padI);

    for r = 2:rows-1
        for c = 2:cols-1
            row1 = r - 1;
            row2 = r + 1;

            col1 = c - 1;
            col2 = c + 1;

            s = padI(row1:row2, col1:col2);

            sum = 0;
                            
            if s(2, 2) == 0
                sum = sum + abs(s(2, 3) - s(1, 3));
                sum = sum + abs(s(1, 3) - s(1, 2));
                sum = sum + abs(s(1, 2) - s(1, 1));
                sum = sum + abs(s(1, 1) - s(2, 1));
                sum = sum + abs(s(2, 1) - s(3, 1));
                sum = sum + abs(s(3, 1) - s(3, 2));
                sum = sum + abs(s(3, 2) - s(3, 3));
                sum = sum + abs(s(3, 3) - s(2, 3));
            end
            
            CN(r-1, c-1) = 0.5 * sum;
            
%             if 0.5 * sum == 1
%                 x = 0;
%             end
        end
    end
end