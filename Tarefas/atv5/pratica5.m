pkg load image;

img = imread("pratica5.jpg");
imgDouble = im2double(img);
sz = size(img);
width = sz(1);
height = sz(2);
figure, imshow(img);
filterF = (ones(9,9) / 81);
imgDouble = filter2(filterF, imgDouble);

figure, imshow(imgDouble);
imwrite(imgDouble, "imagem1.jpg");

# A imagem final estava borrada devido ao tamanho do filtro.
# Quando se realiza a média dos valores fora dos limites da imagem forma-se uma borda preta na mesma devido aos valores zero adicionados nas bordas

img2 = im2double(img);
img2 = padarray(img2, [4 4], "replicate");
img2 = filter2(filterF, img2, "valid");

figure, imshow(img2);
imwrite(img2, "imagem2.jpg");

sobel1 = [-1,-2,-1;0,0,0;1,2,1];
sobel2 = [-1,0,1;-2,0,2;-1,0,1];

aux = im2double(img);
imgSobel1 = filter2(sobel1, aux);
imgSobel2 = filter2(sobel2, aux);
aux = sqrt(imgSobel1.^2 + imgSobel2.^2);

figure, imshow(aux);
imwrite(aux, "imagem3.jpg");