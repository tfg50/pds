wp = 0.75*pi; ws = 0.6*pi;
A = 50;
B = 0.5842*(A - 21)^0.4 + 0.07886*(A - 21);
tr_width = abs(ws - wp);
M = ceil((A - 8)/(2.285*tr_width)) + 1;
wc = (ws + wp)/2;
hd = ideal_lp(pi, M) - ideal_lp (wc, M);
w_kaiser = (kaiser(M, B));
h = hd.*w_kaiser;
[db, mag, pha, w] = freqz_m(h, [1]);

subplot(2, 1, 2); stem((0:(size(h, 1)-1)).', h, 'b'); ylabel('h[n]'); xlabel('n'); title('Coeficientes do filtro');
subplot(2, 1, 1); plot((0:(size(db, 1)-1)).'./(size(db, 1)), db, 'b'); ylabel('Decibeis'); xlabel('frequencia em pi unidades'); title('filtro na frequencia');