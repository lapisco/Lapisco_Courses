%%
close all;
clear all;
clc;

%%
filename = uigetfile({'*.tdms'}, 'File Selector', 'MultiSelect', 'On')

%% Fourier Transform:

fs = 10000;
fund = 60;
harmonicas = [1];

Data_raw = TDMS_getStruct(filename)
y = Data_raw.Untitled.Corrente_R.data;    
FFT.R = featureExtraction_fft(y, fs, fund, harmonicas);


figure_preset_Full()
hold on
plot(Data_raw.Untitled_3.Corrente_R.data, 'b', 'LineWidth', 1.5)
plot(Data_raw.Untitled_3.Corrente_S.data, 'r', 'LineWidth', 1.5)
plot(Data_raw.Untitled_3.Corrente_T.data, 'g', 'LineWidth', 1.5)
figure_postset('Tempo (s)', 'Corrente (A)')


%% Comparações entre os espectros:
load colors_01.mat
rng(s)

colorVec = [1 0 0; 0 1 0; 0 0 1];

figure_preset_Full()
hold on
plot(FFT.R.frequency, FFT.R.magnitude, 'Color', rand(1,3), 'LineWidth', 4)

xlabel = 'Frequency (Hz)';
ylabel = 'Amplitude';

figure_postset(xlabel, ylabel)
           
%saveFig_eps('Harmonicas')






