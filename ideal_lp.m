function hd = ideal_lp(wc, M)
  % Ideal low pass filter
  % wc = cutoff frequency
  % M = length of the ideal filter
  alpha = (M - 1)/2;
  n = [0:(M-1)].';
  m = n - alpha + eps;
  hd = sin(wc*m)./(pi*m); 
endfunction