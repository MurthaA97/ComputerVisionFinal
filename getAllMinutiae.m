function [m] = getAllMinutiae(path, display)
    img = imread(path);
    [~, ~, c] = size(img);
    if c > 1
        img = rgb2gray(img);
    end

    [thinned, reliability, orient_img] = ridgeThin(img, display);

    CN = findCN(thinned) .* (reliability > 0.5);

    m = extractMinutiae(CN, orient_img, thinned, display);
end