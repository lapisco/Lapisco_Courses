%%
clc
close all
clear all
%% Gera onda senoidais

% Define a frequência da fundamental (Hz)
fund = 1;

% Define as múltiplas da fundamental k = 1,2,3,4...n
f = [4*fund 5*fund];      

w = 2*pi.*f;

t = 0:0.001:2;

y(:,1) = sin(w(1)*t);

y(:,2) = sin(w(2)*t);

%% Produto Interno entre ondas múltiplas 

Produto_interno = (y(:,1)./length(y(:,1)))' * (y(:,2)./length(y(:,2)))

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
legenda = {[num2str(f(1)) ' Hz'], [num2str(f(2)) ' Hz']};

figure_postset(xlabel, ylabel, 'Legend', legenda, 'Orientation', ...
               'vertical')
%% Save figures      
saveFig_eps('Senos_02')