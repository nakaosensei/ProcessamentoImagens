img = imread("pollen.jpg");
sz = size(img);
width = sz(1);
height = sz(2);

m = zeros(width, height, "uint8");
v = zeros(1, 256, "uint8");

r1 = 90;
s1 = 10;
r2 = 150;
s2 = 120;

m1 = (s1 - 0) / (r1 - 0);
m2 = (s2 - s1) / (r2 - r1);
m3 = (255 - s2) / (255 - r2);



for i = 1 : r1 
   v(i) = 0 + m1 * ((i - 1) - 0);
endfor

for i = r1 : r2
  v(i) = s1 + m2 * ((i - 1) - r1);
endfor

for i = r2 : 256
  v(i) = s2 + m3 * ((i - 1) - r2);
endfor


for i = 1 : width
  for j = 1 : height
    m(i, j) = v(img(i, j));
  endfor
endfor

imwrite(m, "filerino.jpg");  