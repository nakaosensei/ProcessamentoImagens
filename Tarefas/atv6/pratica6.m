pkg load image; 

img = imread("pratica6.png");
figure, imshow(img);
sz = size(img);
img = im2double(img);


spectre = fft2(img, sz(1) * 2, sz(2) * 2); #Passo 4
# As dimensões da transformada corespondem ao dobro da imagem original
fourier = fftshift(spectre);               #Passo 5
spectre = abs(fourier);                    #Passo 6
P = sz(1) * 2;
Q = sz(2) * 2;
u = 0;
v = 0;

# As funções, juntamente com o for aplicam o filtro passa-baixa com D0 = 20
function res = D(u, v, P, Q)
  res = sqrt((u - P / 2) ^ 2 + (v - Q / 2) ^ 2);
endfunction

function res = H(u, v, P, Q, D0)
  res = e ^ - ((D(u, v, P, Q)) ^ 2 / (2 * D0 ^ 2));
endfunction

newImg = uint8(spectre);
#figure, imshow(newImg);

h = zeros (P, Q, "double");
for i = 1 : P
  for j = 1 : Q
    h(i, j) = H(i, j, P, Q, 20) ;
  end
end

#figure, imshow(im2uint8(h));

M = fourier .* h;
#figure, imshow(M);
M = ifftshift(M);
#figure, imshow(M);
M = ifft2(M);
M = real(M);
figure, imshow(im2uint8(M));

MP = (size(M))(1);
MQ = (size(M))(2);
final = zeros (MP / 2, MQ / 2);

for i = 1 : MP / 2
   for j = 1 : MQ / 2
     final(i, j) = M(i, j);
   endfor
endfor

figure, imshow(final);