%%
close all;
clear all;
clc;
%% Gera onda senoidais

% Define a frequência da fundamental (Hz)
fund = 1;

% Define as múltiplas da fundamental k = 1,2,3,4...n
f = [fund 4*fund 5*fund];      

w = 2*pi.*f;

T = 0.001;
t = 0:T:2;

y(:,1) = sin(w(1)*t);

y(:,2) = 10*sin(w(2)*t);

y(:,3) = sin(w(3)*t);

y_total = y(:,1) + y(:,2) + y(:,3);

%% Fourier Transform:

Y_fft = fft(y_total);

Mag = abs(Y_fft/length(Y_fft));

Mag_final = Mag;
%Mag_final = Mag(1:ceil(length(Y_fft)/2));

%Mag_final = Mag_final * 2;

% Frequency vector:
fs = 1/T;
L = length(y_total);
res = fs/L;

f_fft = fs*(0:(L/2))/L;

figure_preset()
%plot(f_fft, Mag_final, 'LineWidth', 2.5)
plot(Mag_final, 'LineWidth', 2.5)

xlabel = 'Frequency (Hz)';
ylabel = 'Amplitude';

figure_postset(xlabel, ylabel)

%% Plots

% Figura 01

load colors_01.mat;
rng(s);

figure_preset()
hold on

for i = 1:length(f)
   
    plot(t,y(:,i), 'Color',rand(1,3) , 'LineWidth', 3)
    
end

xlabel = 'Tempo (s)';
ylabel = 'Amplitude';
legenda = {[num2str(f(1)) ' Hz'], [num2str(f(2)) ' Hz'], [num2str(f(3)) ' Hz'],};

figure_postset(xlabel, ylabel, 'Legend', legenda, 'Orientation', ...
               'vertical')

           
% Figura 02

load colors_01.mat;
rng(s);

figure_preset()
hold on


plot(t,y_total, 'Color',rand(1,3) , 'LineWidth', 3)
    

xlabel = 'Tempo (s)';
ylabel = 'Amplitude';

figure_postset(xlabel, ylabel)









