image = imread('lena_rings.bmp');

%no octave ja vem gray
%gray = rgb2gray(image);
gray = image;
% filtros diretos
imwrite(uint8(conv2(double(gray), mean(3), 'valid')), 'lena_mean3.bmp', 'bmp');
imwrite(uint8(conv2(double(gray), mean(5), 'valid')), 'lena_mean5.bmp', 'bmp');
imwrite(uint8(conv2(double(gray), gaussian2d(3, 2), 'valid')), 'lena_gauss.bmp', 'bmp');
filtro = mean(3);
%sobelX = [[-1, 0, 1]; [-2, 0, 2]; [-1, 0, 1]];
%sobelY = [[-1, -2, -1]; [0, 0, 0]; [1, 2, 1]];
%gray = uint8(conv2(double(gray), double(filtro), 'valid'));
%borderX = uint8(conv2(double(gray), double(sobelX), 'same'));
%borderY = uint8(conv2(double(gray), double(sobelY), 'same'));
n = length(gray);
alpha = 0.5;
grayX = gray;
grayY = gray;
D = 2;
%filtro iir para X
for i = 1:n
  for j = (1+D):n
    grayX(i, j) = grayX(i, j) * alpha + (1 - alpha) * grayX(i, j-D);
  endfor
endfor
for i = (1+D):n
  for j = 1:n
    grayY(i, j) = grayY(i, j) * alpha + (1 - alpha) * grayY(i-D, j);
  endfor
endfor
figure();
imshow(grayX);
figure();
imshow(grayY);
gray = grayX;
%filtro iir para Y
for i = 2:n
  for j = 1:n
    gray(i, j) = gray(i, j) * alpha + (1 - alpha) * gray(i-1, j);
  endfor
endfor
figure();
imshow(gray);
imwrite(uint8(gray), 'lena_iir.bmp', 'bmp');