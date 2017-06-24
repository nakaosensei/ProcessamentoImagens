pkg load image;

img = imread("pratica7.png");
figure, imshow(img);

sz = size(img);
img = im2double(img);

spectre = fft2(img, sz(1) * 2, sz(2) * 2);
fourier = fftshift(spectre);               #Passo 5
spectre = abs(fourier);                    #Passo 6

newImg = uint8(spectre);
figure, imshow(newImg);

filter = zeros(sz(1)*2,sz(2)*2,"double");

for i = 1 : sz(1)*2
  for j = 1 : sz(2)*2
      filter(i,j) = 1;    
  end  
end

for i = 1 : sz(2)*2
  if i<sz(2)-7 || i>sz(2)+7
    filter(sz(1),i) = 0;
  endif  
end
imwrite(filter, "filtro.png")
figure, imshow(filter);

fourier = fourier .* filter;
spectre = spectre .* filter;
figure, imshow(uint8(spectre));
M = ifftshift(fourier);
M = ifft2(M);
M = real(M);
#figure, imshow(im2uint8(M));

MP = (size(M))(1);
MQ = (size(M))(2);
final = zeros (MP / 2, MQ / 2);

for i = 1 : MP / 2
   for j = 1 : MQ / 2
     final(i, j) = M(i, j);
   endfor
endfor

figure, imshow(final);






