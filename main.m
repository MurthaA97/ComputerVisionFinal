clear
clc

display = 0;
n101_1 = 'FingerprintImages/101_1.tif';
n101_2 = 'FingerprintImages/101_2.tif';
n101_3 = 'FingerprintImages/101_3.tif';
n101_4 = 'FingerprintImages/101_4.tif';
n101_5 = 'FingerprintImages/101_5.tif';
n101_6 = 'FingerprintImages/101_6.tif';
n101_7 = 'FingerprintImages/101_7.tif';
n101_8 = 'FingerprintImages/101_8.tif';
n102_1 = 'FingerprintImages/102_1.tif';
n104_1 = 'FingerprintImages/104_1.tif';

T1.minutiae = getAllMinutiae(n101_1, display); 
T2.minutiae = getAllMinutiae(n101_2, display);
% T3.minutiae = getAllMinutiae(n101_3, display);
% T4.minutiae = getAllMinutiae(n101_4, display);
% T5.minutiae = getAllMinutiae(n101_5, display);
templates = [T1 T2];

[I] = getAllMinutiae(n102_1, display);

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

if S_g > 0.43
    fprintf('Match!\n');
else
    fprintf('No Match found...\n');
end



