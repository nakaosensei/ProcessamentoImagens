pkg load image;

img = imread("pratica8b.png");
nImg = gray2ind(img);
rgb = ind2rgb(nImg, ocean);
imshow(rgb);
imwrite(rgb,"out.png");