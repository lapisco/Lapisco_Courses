%%
close all;
clear all;
clc;
%% Gera onda senoidais

% Define a frequência da fundamental (Hz)
fund = 1;

% Define harmônicas
harmonicas = [10 20 51];      

w = 2*pi.*fund;

T = 0.0001;
t = 0:T:2;

y(:,1) = 10*sin(w(1)*t);

ruido = 100*randn(length(y),1);

y_total = y(:,1) + ruido;

%% Fourier Transform:

fs = 1/T;

FFT = featureExtraction_fft(y_total', fs, fund, harmonicas)

figure_preset()
plot(FFT.frequency, FFT.magnitude, 'LineWidth', 2)

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









