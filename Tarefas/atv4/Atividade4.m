pkg load image

function result = atv(img, w, h, M, V, num)
  result = zeros(w, h, "double");
  for i = 1 : num
    result += imnoise(img, "gaussian", M, V) / num;
  endfor
endfunction

img = imread("pratica4.png");
sz = size(img);
img = im2double(img);
w = sz(1);
h = sz(2);
figure, imhist(img);
noise = imnoise(img, "gaussian", 0, 64);
figure, imhist(noise);

# A imagem com ruído possui mais tons de preto e branco, ao contrário da original que possui grande quantidade de tons de cinza.
aux = imabsdiff(img, noise);

img8 = zeros(w, h, "double");
img8 = atv(img, w, h, 0, 0.25, 8);
figure, imshow(img8);
imwrite(img8, "imagem8.png");

img16 = zeros(w, h, "double");
img16 = atv(img, w, h, 0, 0.25, 16);
figure, imshow(img16);
imwrite(img16, "imagem16.png");

img64 = zeros(w, h, "double");
img64 = atv(img, w, h, 0, 0.25, 64);
figure, imshow(img64);
imwrite(img64, "imagem64.png");