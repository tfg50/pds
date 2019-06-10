info = aviinfo('video1.avi');
frames = info.NumFrames;
video2 = avifile('video2.avi', 'fps', info.FramesPerSecond);
for i = 2:frames
  image = aviread('video1.avi', i)-aviread('video1.avi', i-1);
  image = abs(image);
  image = image .* 0.5;
  %image = arrayfun(@cut, image);
  addframe(video2, image);
endfor
clear video2;