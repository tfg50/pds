%IMG_PATH = ('C:\Users\Vítor Hugo\Desktop\tfg\pds');
%image = file_in_path(IMG_PATH, 'alumgrns.bmp');
image = imread('alumgrns.bmp');

%no octave ja vem gray
%gray = rgb2gray(image);
gray = image;
figure();
imshow(gray);

%EXERCICIO 5
filtro = [-1, -1, -1; -1, 9, -1; -1, -1, -1];
filtro = mean(5);
figure();
imshow(gray);
gray = uint8(conv2(double(gray), double(filtro), "valid"));
imshow(gray);
%esse filtro destaca a diferença entre o pixel central
%os adjacentes.