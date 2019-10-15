%%
close all;
clear all;
clc;
%% Gera fun��o de teste
%%%%%%%%%%% onda quadrada:
T1 = 10^-5;          % periodo de amostragem para confec��o da onda
f1 = 1/T1;           % frequ�ncia de amostragem para confec��o da onda

f1 = 1000;            % frequ�ncia de amostragem para confec��o da onda
T1 = 1/f1;            % periodo de amostragem para confec��o da onda

t_ = 0:T1:2;

f = 5;
T0 = 1/f;
w1 = 2*pi*f;

x = 5*square(w1*t_) + 5;

figure(1)
subplot(2,1,1)
plot(t_,x,'LineWidth',2)
    title ('Onda de teste')
    xlabel('Tempo')
    ylabel('Sinal Peri�dico')
    
%% Descobrir periodo do sinal e frequ�ncia de amostragem

[peaks,position]= findpeaks(x);
n1 = position(1);
n2 = position(2);

[NNp Np] = size(x); %numero de pontos

Npt = n2 - n1;  %n�mero de pontos por periodo

tmax = 2;       % tempo m�ximo de simula��o estipulado

Ts = tmax/Np;   % Per�odo de amostragem
fs = 1/Ts;      % Frequ�ncia de amostragem

t = 0:Ts:tmax;
[ss s] = size(t);

if s > Np
   t(s) = [];
end

[ss s] = size(t);

Tr = (t(n2) - t(n1));   % Per�odo calculado do sinal
fr = 1/Tr;              % Frequ�ncia calculada do sinal

t1 = position(1);
t2 = position(2);

subplot(2,1,2)
plot(t,x,'LineWidth',2)
    title ('Onda de teste Replotada')
    xlabel('Tempo')
    ylabel('Sinal Peri�dico')    

%% Gera��o dos senos e cossenos em fun��o da frequ�ncia da onda amostrada

w = 2*pi*fr;

a0 = sum(x)/s;

for n = 1:1:25
    F1 = cos(n*w*t);
    V1 = F1.*x;
    a(n) = 2*sum(V1)/s;
    
    F2 = sin(n*w*t);
    V2 = F2.*x;
    b(n) = 2*sum(V2)/s;
end

C0 = a0;
C = sqrt(a.^2 + b.^2);

Teta_ = atan((-b./a));

C_final_(1) = C0;
for n = 2:1:26
    C_final_(n) = C(n-1);
end

Teta_final_(1) = 0;
for n = 2:1:26
    Teta_final_(n) = Teta_(n-1);
end

w_rad = 0:pi:25*pi;

freq = 0:fr:25*fr;

%% Plotagem do Espectro de sinal e frequ�ncia

figure(2)
    subplot(2,1,1)
    stem(freq,C_final_,'k','fill')
    title ('Espectro de Amplitudes')
    xlabel('f (Hz)')
    ylabel('C(n)')
    
    subplot(2,1,2)
    stem(freq,Teta_final_,'k','fill')
    title ('Espectro de Fases')
    xlabel('f (Hz)')
    ylabel('C(n)')

%% Reconstitui��o do sinal com 25 Harm�nicas
R1 = 0;

for n = 1:1:25
    
    R1 = C(n)*cos(n*w.*t + Teta_(n)) + R1;
    
end

R1 = R1 + C0;

figure(3)
subplot(2,1,1)
plot(t,x,'LineWidth',2)
    title ('Onda Original')
    xlabel('Tempo')
    ylabel('Sinal Peri�dico')
subplot(2,1,2)
plot(t,R1,'LineWidth',2)
    title ('Onda Reconstituida com 25 Harm�nicas')
    xlabel('Tempo')
    ylabel('Sinal Peri�dico')
    hold on

%% Plotagem da onda e com suas harm�nicas �mpares

HarmoF = C0+ C(1)*cos(1*w*t + Teta_(1));
Harmo3 = C0+ C(3)*cos(3*w*t + Teta_(3));
Harmo5 = C0+ C(5)*cos(5*w*t + Teta_(5));
Harmo7 = C0+ C(7)*cos(7*w*t + Teta_(7));

figure(4)
%subplot(2,1,1)
plot(t,x,'LineWidth',2)
    title ('Onda Original')
    xlabel('Tempo')
    ylabel('Sinal Peri�dico')
    hold on
plot(t,C0,'r','LineWidth',2)
    hold on
plot(t,HarmoF,'k')
    hold on
plot(t,Harmo3,'g')
    hold on
plot(t,Harmo5,'y','LineWidth',2)
    hold on
plot(t,Harmo7,'m')
    hold on










