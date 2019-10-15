close all; clear; clc;

whaleFile = fullfile(matlabroot,'examples','matlab','bluewhale.au');
[w,fs] = audioread(whaleFile);


subplot(2,1,1)
plot(w)

player = audioplayer(w, fs);
play(player);
% stop(player);

novo_sinal = w(4861:13700);

subplot(2,1,2)
plot(novo_sinal)

player = audioplayer(novo_sinal, fs);
play(player);