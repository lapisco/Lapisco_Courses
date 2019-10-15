close all; clear; clc;

%% Cria o sinal
Fs = 20000;             % taxa de amostragem: 20mil amostras/seg
t = 0:(1/Fs):0.05;      % amostragem de 0,02seg
f1=100;      f2=2000;     f3=3000;     f4=4000;
N = max(t)/(1/Fs);
n = 0:N;    % quantidade de amostras da entrada para filtrar

sinal_ent = sin(2*pi*f1.*n/Fs) + sin(2*pi*f2.*n/Fs) + sin(2*pi*f3.*n/Fs) + sin(2*pi*f4.*n/Fs);
% sinal_ent = [2 1 2 4];


%% Filtro
filtro = [1 1 1 1 1]; % Escolha o filtro
tam_filtro = length(filtro);


%% Cria novo sinal
sinal_preen = [zeros(1, tam_filtro-1) sinal_ent zeros(1, tam_filtro-1)];
sinal_filt = zeros(1, length(sinal_ent) + tam_filtro - 1);


%% Convolucao
for i = 1 : length(sinal_filt)
    sinal_seg = sinal_preen(i:tam_filtro+i-1); %sinal segmentando
    sinal_filt(i) = sum(sinal_seg .* filtro); % muda por operacao
end

subplot(2,1,1), plot(sinal_ent)
subplot(2,1,2), plot(sinal_filt)