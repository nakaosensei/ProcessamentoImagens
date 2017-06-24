pkg load image;
sz = size(img);
width = sz(1);
height = sz(2);
m = zeros(width, height, "uint8");
img = imread("imagem.jpg");
MN = 679 * 800;
prRk = zeros(1 , 256, "double");

hist = imhist(img);
result = zeros(1 , 256, "double");
resultInt = zeros(1, 256, "uint8");

for i = 1 : 256 
   prRk(i) = hist(i,1)/MN;
endfor

for i = 1: 256
  result(i) = 255 * prRk(i)
  if( i>1 )
    for j = 1: i-1
      result(i) = result(i) + 255 * prRk(j) 
    endfor
  endif
  resultInt(i) = round(result(i))  
endfor

for(i = 1 : 256)
  result(i)=i
endfor

for i = 1 : width
  for j = 1 : height
    m(i, j) = resultInt(img(i, j));
  endfor
endfor

plot(result, resultInt);
imshow(m);
imwrite(m, "filerino.jpg"); 

