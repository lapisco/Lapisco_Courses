clear; close all; clc;

%{
Encontrando picos no sinal ECG
%}

%% Carregar o sinal ECG
sinal = load('sinal_ecg');
sinal = sinal.ECG_data;
t = 1:length(sinal);

subplot(2,2,1)
plot(t,sinal)
xlabel('Amostras');
ylabel('Tensao(mV)')
grid on


% Onda R: picos acima de 0.5mV
[~,locs_Rwave] = findpeaks(sinal,'MinPeakHeight',0.5,...
                                    'MinPeakDistance',200);
% Onda S: sinal invertido                                
ECG_inverted = -sinal;
[~,locs_Swave] = findpeaks(ECG_inverted,'MinPeakHeight',0.5,...
                                        'MinPeakDistance',200);                  
subplot(2,2,2)
hold on 
plot(t,sinal)
plot(locs_Rwave,sinal(locs_Rwave),'rv','MarkerFaceColor','r')
plot(locs_Swave,sinal(locs_Swave),'rs','MarkerFaceColor','b')
axis([0 1850 -1.1 1.1])
grid on
legend('sinal ECG','ondas-R','ondas-S')
xlabel('Amostras')
ylabel('Tensao(mV)')


% Filtra o sinal
smoothECG = sgolayfilt(sinal,7,21);
smoothECG = sinal;

subplot(2,2,3)
plot(t,sinal,'b',t,smoothECG,'r')
grid on
axis tight
xlabel('Samples')
ylabel('Voltage(mV)')
legend('Noisy ECG Signal','Filtered Signal')
title('Filtering Noisy ECG Signal')


% Onda Q
[~,min_locs] = findpeaks(-smoothECG,'MinPeakDistance',40);

% Picos entre -0.2mV e -0.5mV
locs_Qwave = min_locs(smoothECG(min_locs)>-0.5 & smoothECG(min_locs)<-0.2);

subplot(2,2,4)
hold on
plot(t,smoothECG); 
plot(locs_Qwave,smoothECG(locs_Qwave),'rs','MarkerFaceColor','g')
plot(locs_Rwave,smoothECG(locs_Rwave),'rv','MarkerFaceColor','r')
plot(locs_Swave,smoothECG(locs_Swave),'rs','MarkerFaceColor','b')
grid on
xlabel('Amostras')
ylabel('Tensao(mV)')
ax = axis;
axis([0 1850 -1.1 1.1])
legend('Sinal ECG filtrado','onda-Q','onda-R','onda-S')