filePath = 'FingerprintImages/105_2.tif';
im = imread(filePath);

[newim, binim, mask, reliability] =  testfin(im, 0);

