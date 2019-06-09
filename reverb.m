function y = reverb(audio, d, a)
y = audio;
n = length(audio);
for i = (d+1):n
  y(i) = y(i) + y(i-d) * a;
endfor
endfunction;