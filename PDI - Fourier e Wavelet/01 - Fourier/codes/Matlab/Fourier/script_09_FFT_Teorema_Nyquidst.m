%% Corrente do motor adquirida a 1, 5 e 10 kHz
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

load colors_01.mat
rng(s)


Data_raw{1} = TDMS_getStruct(filename{1});
y = Data_raw{1}.Untitled_3.Corrente_R.data;    
FFT{1}.R = featureExtraction_fft(y, fs, fund, harmonicas);

figure_preset_Full()
hold on
plot(Data_raw{1}.Untitled_3.Corrente_R.data,'Color', rand(1,3), 'LineWidth', 1.5)

%
Data_raw{3} = TDMS_getStruct(filename{3});
y = Data_raw{3}.Untitled.Corrente_R.data;    
FFT{1}.R = featureExtraction_fft(y, fs, fund, harmonicas);

plot(Data_raw{3}.Untitled.Corrente_R.data,'Color', rand(1,3),'LineWidth', 1.5)


%
Data_raw{2} = TDMS_getStruct(filename{2});
y = Data_raw{2}.Untitled.Corrente_R.data;    
FFT{1}.R = featureExtraction_fft(y, fs, fund, harmonicas);

plot(Data_raw{2}.Untitled.Corrente_R.data,'Color', rand(1,3), 'LineWidth', 1.5)

legenda = {'10 kHz', '5 kHz', '1 kHz'};

figure_postset('Tempo (s)', '$I$ (A)', 'Legend', legenda, 'Orientation', ...
                'Vertical', 'Comparativos entre fs')
%%
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






