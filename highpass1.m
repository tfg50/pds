wp = 0.75*pi; ws = 0.6*pi;
tr_width = abs(ws - wp);
M = ceil(6.6*pi/tr_width) + 1;
wc = (ws + wp)/2;
hd = ideal_lp(pi, M) - ideal_lp (wc, M);
w_ham = (hamming(M));
h = hd.*w_ham;
[db, mag, pha, w] = freqz_m(h, [1]);

subplot(2, 1, 2); stem((0:(size(h, 1)-1)).', h, 'b'); ylabel('h[n]'); xlabel('n'); title('Coeficientes do filtro');
subplot(2, 1, 1); plot((0:(size(db, 1)-1)).'./(size(db, 1)), db, 'b'); ylabel('Decibeis'); xlabel('frequencia em pi unidades'); title('filtro na frequencia');