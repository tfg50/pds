image = imread('dalton.bmp');
R = image(:,:,1);
G = image(:,:,2);
B = image(:,:,3);
% usei isso pra carregar as imagens de cada componente
%imwrite(R, 'daltonR.bmp', 'bmp');
%imwrite(G, 'daltonG.bmp', 'bmp');
%imwrite(B, 'daltonB.bmp', 'bmp');
gray = rgb2gray(image);
n = size(image, 1);
m = size(image, 2);
image2 = zeros(n, m);
%alpha = 0.7;
%threshold1 = 150;
%threshold2 = 140;
%threshold3 = 70;
for i = 1:n
  for j = 1:m
    %mudanca de cor
    
    %tentativa de espalhar cores para outro tipo de cor
    %for k = 1:3
    %  if(k == 3)
    %    image2(i, j, k) = (image(i, j, k) * alpha + (1 - alpha) * image(i, j, 1));
    %  else
    %    image2(i, j, k) = (image(i, j, k) * alpha + (1 - alpha) * image(i, j, k+1));
    %  endif
    %endfor
    
    %escuro eh muito vermelho e pouco verde
    image2(i, j) = 255 - gray(i, j)*((double(R(i, j)) / 200) * ((255 - double(G(i, j))) / 200));
    
    %threshold, quer vermelho, azul e nao verde
    %if(R(i, j) > threshold1 && G(i, j) < threshold2 && B(i, j) > threshold3)
    %  image2(i, j) = image(i, j);
    %else
    %  for k = 1:3
    %    image2(i, j, k) = 255;
    %  endfor
    %endif
    
    %para cinza com enfase no vermelho
    %image2(i, j) = 0.8 * R(i, j) + 0.05 * G(i, j) + 0.15 * B(i, j);
  endfor
endfor
imwrite(uint8(image2), 'dalton2.bmp', 'bmp');