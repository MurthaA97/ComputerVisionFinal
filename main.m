clear
clc

display = 0;
path_t = 'FingerprintImages/101_1.tif';
path_i = 'FingerprintImages/101_2.tif';

[T] = getAllMinutiae(path_t, display);
[I] = getAllMinutiae(path_i, display);

% when two fingerprints share 12 or more minutae, they are considered
% to be from the same finger

[t1_polar] = convertToPolar(T, 1, 0);
[i1_polar] = convertToPolar(I, 1, 1);