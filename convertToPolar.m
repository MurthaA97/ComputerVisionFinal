function p = convertToPolar(m, ref_idx)
    ref = m(ref_idx, :);
    p = zeros([size(m, 1) 3]);
    
    p(:, 1) = sqrt((m(:, 1) - ref(1)).^2 + (m(:, 2) - ref(2)).^2);
    p(:, 2) = atan2(m(:, 1) - ref(1), m(:, 2) - ref(2));
    p(:, 3) = m(:, 3) - ref(3);
end