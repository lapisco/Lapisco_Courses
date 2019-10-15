close all; clear; clc;

sinal = load('p_5_2.mat');
sinal = sinal.eeg_signal;
nome_wavelet = 'db1';

[A1, D1] = dwt(sinal,nome_wavelet);
[A2, D2] = dwt(A1,nome_wavelet);
[A3, D3] = dwt(A2,nome_wavelet);
[A4, D4] = dwt(A3,nome_wavelet);

subplot(5,1,1), plot(A4)
subplot(5,1,2), plot(D4)
subplot(5,1,3), plot(D3)
subplot(5,1,4), plot(D2)
subplot(5,1,5), plot(D1)
