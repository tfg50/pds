[audio, sampleRate] = audioread('teste_de_som.wav');
n = length(audio);
subplot(2, 1, 1); stem((1:n).'./sampleRate, audio, 'b'); ylabel('amplitude'); title('audio original');
noise = (1:n).';
noise = sin(noise.*(2*pi*466.16/sampleRate));
audio = audio.*60 + noise;
subplot(2, 1, 2); stem((1:n).'./sampleRate, audio, 'b'); ylabel('amplitude'); title('audio com ruido');
%audiowrite('teste_de_som2.wav', audio, sampleRate);
%audiowrite('teste_de_som2.wav', conv(audio, fir1(200, 0.1, 'low')), sampleRate);
%audiowrite('teste_de_som2.wav', conv(audio, fir1(200, 0.15, 'high')), sampleRate);
% filtro fir corta faixa na janela [0.10, 0.14]
audiowrite('teste_de_som2.wav', conv(audio, fir1(200, [0.10, 0.14], 'stop')), sampleRate);
%audiowrite('teste_de_som2.wav', reverb(audio, 100, 0.4), sampleRate);