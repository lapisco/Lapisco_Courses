%%
clc
close all
clear all
%%

normal = load('b000c30c000(vibracao).dat');
falha3Bajd = load('b000c30c000b3_a(vibracao).dat');


%%

figure_preset_Full()
hold on
plot(normal(:,1), 'b', 'LineWidth', 1.5)
plot(falha3Bajd(:,1), 'r', 'LineWidth', 1.5)

figure_postset('Tempo (s)', 'Amplitude','Legend', {'Normal', '3 Barras'}, ...
                'Orientation', 'Vertical')

%% Fourier:

FFT_normal = featureExtraction_fft(normal(:,1));
FFT_falha = featureExtraction_fft(falha3Bajd(:,1));

figure_preset_Full()

hold on
plot(FFT_normal.magnitude, 'b', 'LineWidth', 1.5)
plot(FFT_falha.magnitude, 'r', 'LineWidth', 1.5)

figure_postset('F (Hz)', 'Amplitude','Legend', {'Normal', '3 Barras'}, ...
                'Orientation', 'Vertical')

            
%% Abordagem no domínio do tempo:

figure_preset_Full()
histfit(normal(:,1))