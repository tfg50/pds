% carregando video
info = aviinfo('video1.avi');
frames = info.NumFrames;
video2 = avifile('video2.avi', 'fps', info.FramesPerSecond);
for i = 2:frames
  % o frame eh a diferenca absoluta entre o frame atual e o frame anterior
  image = aviread('video1.avi', i)-aviread('video1.avi', i-1);
  image = abs(image);
  % escurecido
  image = image .* 0.5;
  addframe(video2, image);
endfor
% precisa disso pra carregar a imagem num arquivo
clear video2;