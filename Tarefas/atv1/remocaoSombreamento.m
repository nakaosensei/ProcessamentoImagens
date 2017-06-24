pkg load image

img = imread("img.tif");
shf = imread("filter.tif");
imgD = im2double(img);
shfD = im2double(shf);
imshow(imgD);
imgCTest = imgD./shfD;
imshow(imgCTest);
