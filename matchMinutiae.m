function S_g = matchMinutiae(templates, I)
    S = 0; S_g = 0;
    for t = 1:size(templates, 2)
        T = templates(t).minutiae;
        for i = 1:size(T, 1)
            t_prime = transform(T, i);
            for j = 1:size(I, 1)
                i_prime = transform(I, j);
                for alpha = -5:5
                    i_oriented = transform2(i_prime, alpha * pi / 180);
                    curr_score = score(t_prime, i_oriented);
                    if S < curr_score, S = curr_score; end
                end
            end
        end
        if S_g < S, S_g = S; end
        S = 0;
    end
end