close all; clear; clc;

sinal = load('p_5_2');
sinal = sinal.eeg_signal;


%% Primeiro modo de computar Wavelet
w_name = 'db3';
[A1, D1] = dwt(sinal,w_name);
[A2, D2] = dwt(A1,w_name);
[A3, D3] = dwt(A2,w_name);
[A4, D4] = dwt(A3,w_name);

subplot(6,1,1), plot(sinal)
subplot(6,1,2), plot(A4) % aproximacao
subplot(6,1,3), plot(D4) % detalhe4
subplot(6,1,4), plot(D3) % detalhe3
subplot(6,1,5), plot(D2) % detalhe2
subplot(6,1,6), plot(D1) % detalhe1



%% Segundo modo de computar Wavelet
[c,l] = wavedec(sinal,4,w_name);
[cd1,cd2,cd3,cd4] = detcoef(c,l,[1 2 3 4]);

figure
subplot(6,1,1), plot(sinal)
subplot(6,1,2), plot(c(1:l)) %aproximacao
subplot(6,1,3), plot(cd4) % detalhe4
subplot(6,1,4), plot(cd3) % detalhe3
subplot(6,1,5), plot(cd2) % detalhe2
subplot(6,1,6), plot(cd1) % detalhe1



%% GUI wavelet
wavemenu
dwtmode('status')
dwtmode('zpd')
wavemenu

% [cd1,cd2,cd3,cd4] = detcoef(wm_coef.coefs, wm_coef.longs,[1 2 3 4]);
% figure
% subplot(6,1,1), plot(sinal)
% subplot(6,1,2), plot(c(1:wm_coef.longs(1))) % aproximacao
% subplot(6,1,3), plot(cd4) % detalhe4
% subplot(6,1,4), plot(cd3) % detalhe3
% subplot(6,1,5), plot(cd2) % detalhe2
% subplot(6,1,6), plot(cd1) % detalhe1