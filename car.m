[audio, sampleRate] = audioread("car1.wav");
specgram(audio, 256, sampleRate);
n = length(audio);
%audiowrite('car2.wav', reverb(audio, 500, -0.4), sampleRate);
%audiowrite('car2.wav', conv(audio, [0.2, 1.3, 0.5, 0.2], 'valid'), sampleRate);
audiowrite('car2.wav', conv(audio, [1, -0.1], 'valid'), sampleRate);
specgram(conv(audio, [1, -0.96], 'valid'), 256, sampleRate);