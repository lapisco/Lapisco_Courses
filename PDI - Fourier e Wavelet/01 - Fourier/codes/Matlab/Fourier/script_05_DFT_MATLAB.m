%%
close all;
clear all;
clc;
%% Gera onda senoidais

% Define a frequência da fundamental (Hz)
fund = 1;

% Define as múltiplas da fundamental k = 1,2,3,4...n
f = [fund];      

w = 2*pi.*f;

T = 0.0001;
t = 0:T:2;

y(:,1) = 10*sin(w(1)*t);

ruido = 100*randn(length(y),1);

y_total = y(:,1) + ruido;

%% Fourier Transform:

Y_fft = fft(y_total);

Mag = abs(Y_fft/length(Y_fft));

Mag_final = Mag(1:ceil(length(Y_fft)/2));

Mag_final = Mag_final * 2;

% Frequency vector:
fs = 1/T;
L = length(y_total);
res = fs/L;

f_fft = fs*(0:(L/2))/L;

figure_preset()
plot(f_fft, Mag_final, 'LineWidth', 2)

xlabel = 'Frequency (Hz)';
ylabel = 'Amplitude';

figure_postset(xlabel, ylabel)

%% Plots

% Figura 01

load colors_01.mat;
rng(s);

figure_preset()
hold on

plot(t,ruido, 'Color',rand(1,3) , 'LineWidth', 1)
plot(t,y(:,1)', 'r', 'LineWidth', 3)

xlabel = 'Tempo (s)';
ylabel = 'Amplitude';
legenda = {'Ru\''ido', 'Sinal original'};

figure_postset(xlabel, ylabel, 'Legend', legenda, 'Orientation', ...
               'vertical')

           
% Figura 02

load colors_01.mat;
rng(s);

figure_preset()
plot(t,y_total, 'b', 'LineWidth', 1)
hold on   

xlabel = 'Tempo (s)';
ylabel = 'Amplitude';
title = 'Sinal orignal + ru\''ido';

figure_postset(xlabel, ylabel, 'Title', title)









