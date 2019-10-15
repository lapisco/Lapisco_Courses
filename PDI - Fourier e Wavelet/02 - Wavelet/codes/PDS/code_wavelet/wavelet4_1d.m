%% Exemplo de filtragem com Wavelet 1D
close all; clear; clc;

sinal = load('sinal_rampa');
sinal = sinal.sinal_rampa;

%% Computa a Wavelet
w_name = 'db3';
[c,l] = wavedec(sinal,3,w_name);
[D1,D2,D3] = detcoef(c,l,[1 2 3]);
A3 = appcoef(c,l, w_name, 3);


%% Filtra os coeficientes de detalhe
D1(abs(D1) < 0.69) = 0;
D2(abs(D2) < 0.7) = 0;
D3(abs(D3) < 0.75) = 0;


%% Calcula a inversa 
c = [A3 D3 D2 D1];
sinal_f = waverec(c,l,w_name);


subplot(5,1,1), plot(sinal)
subplot(5,1,2), plot(A3) % aproximacao
subplot(5,1,3), plot(D1) % detalhe1
subplot(5,1,4), plot(D2) % detalhe1
subplot(5,1,5), plot(D3) % detalhe1

figure
subplot(2,1,1), plot(sinal)
subplot(2,1,2), plot(sinal_f)