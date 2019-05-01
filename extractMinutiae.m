function m = extractMinutiae(CN, orient_img, thinned, display)
    [rows, cols] = find(CN == 1 | CN == 3);
    indices = [rows cols];
    
    num = size(indices, 1);
    m = zeros([num 4]);
    for i = 1:num
        idx = indices(i, :);
        x = idx(1);
        y = idx(2);
        m(i, :) = [x y CN(x, y) orient_img(x, y)];
    end
    
    if display
        show(thinned, 5);
        hold on
        plot(cols, rows, 'r*', 'MarkerSize', 5);
        hold off
    end
end