%%
close all;
clear all;
clc;

%%
filename = uigetfile({'*.tdms'}, 'File Selector', 'MultiSelect', 'On')

%% Fourier Transform:

fs = 1000;
fund = 60;
harmonicas = [1];

if iscell(filename)
    for i = 1:length(filename)
        
        Data_raw = TDMS_getStruct(filename{i});
        y = Data_raw.Untitled.Corrente_R.data;    
        FFT{i}.R = featureExtraction_fft(y, fs, fund, harmonicas);
        
        figure_preset_Full()
        subplot(2,1,1)
        plot(Data_raw.Untitled.Corrente_R.data)
        title([filename{i} ' - Corrente do motor'])
        subplot(2,1,2)
        plot(FFT{i}.R.frequency, FFT{i}.R.magnitude, 'LineWidth', 2)        
        title('FFT')

    end
else
    Data_raw = TDMS_getStruct(filename)
    y = Data_raw.Untitled.Corrente_R.data;    
    FFT.R = featureExtraction_fft(y, fs, fund, harmonicas);
end


%% Comparações entre os espectros:
load colors_01.mat
rng(s)

colorVec = [1 0 0; 0 1 0; 0 0 1];

figure_preset_Full()
hold on
plot(FFT{1}.R.frequency, FFT{1}.R.magnitude, 'Color', rand(1,3), 'LineWidth', 4)
plot(FFT{2}.R.frequency, FFT{2}.R.magnitude, 'Color', rand(1,3), 'LineWidth', 2.5)
plot(FFT{3}.R.frequency, FFT{3}.R.magnitude, 'Color', rand(1,3), 'LineWidth', 1.5)

xlabel = 'Frequency (Hz)';
ylabel = 'Amplitude';
legenda = {'Falha + critica', 'Falha - critica', 'Normal'};

figure_postset(xlabel, ylabel, 'Legend', legenda, 'Orientation', ...
               'vertical')
           
saveFig_eps('Harmonicas')






