image = imread('alumgrns.bmp');

%no octave ja vem gray
%gray = rgb2gray(image);
gray = image;

% deteccao de borda
sobelX = [[-1, 0, 1]; [-2, 0, 2]; [-1, 0, 1]];
sobelY = [[-1, -2, -1]; [0, 0, 0]; [1, 2, 1]];
borderX = abs(conv2(double(gray), double(sobelX), 'same'));
borderY = abs(conv2(double(gray), double(sobelY), 'same'));
border = sqrt(borderX.*borderX + borderY.*borderY);
figure();
imshow(gray);
border_threshold = 20;
% inicializando dsu
n = size(gray, 1);
m = size(gray, 2);
for i = 1:n
  for j = 1:m
    if border(i, j) >= border_threshold
      border(i, j) = 255;
    else
      border(i, j) = 0;
    endif
  endfor
endfor
border = conv2(border, mean(3), 'same');
figure();
imshow(uint8(border));
threshold = 50;
area_threshold = 100;
global sz = zeros(n, m);
global parent = zeros(n * m, 1);
for i = 1:n
  for j = 1:m
    sz(i, j) = 1;
    parent((i-1) * m + j) = (i-1) * m + j;
  endfor
endfor
function y = getParent(x)
  global parent;
  if(x != parent(x))
    y = getParent(parent(x));
    parent(x) = y;
  else
    y = x;
  endif
endfunction

function y = makeUnion(a, b)
  y = true;
  global sz;
  global parent;
  a = getParent(a);
  b = getParent(b);
  if(a == b)
    return;
  endif
  if(sz(a) > sz(b))
    c = a;
    a = b;
    b = a;
  endif
  sz(b) = sz(b) + sz(a);
  parent(a) = b;
  y = true;
endfunction

% algoritmo
for i = 1:n
  for j = 1:m
    % conectar
    if(j > 1 && border(i, j) < threshold && border(i, j-1) < threshold)
      makeUnion((i-1)*m + j, (i-1)*m + j - 1);
    endif
    if(i > 1 && border(i, j) < threshold && border(i-1, j) < threshold)
      makeUnion((i-1)*m + j, (i-2)*m + j);
    endif
  endfor
endfor

% pegando cor das componentes
ans = 0;
cor = zeros(n * m, 1);
for i = 1:(n*m)
  if(parent(i) == i && sz(i) >= area_threshold)
    ans = ans + 1;
    cor(i) = 8 * ans;
  else
    cor(i) = 0;
  endif
endfor
ans
for i = 1:n
  for j = 1:m
    gray(i, j) = cor(getParent((i-1)*m + j));
  endfor
endfor
figure();
imshow(gray);
imwrite(gray, 'textures.bmp', 'bmp');