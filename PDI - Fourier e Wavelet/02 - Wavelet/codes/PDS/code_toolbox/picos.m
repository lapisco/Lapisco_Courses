clear; close all; clc;

%% ======================= Encontra Picos =======================
load sunspot.dat
year = sunspot(:,1); 
relNums = sunspot(:,2);

[p, l] = findpeaks(relNums,year);
subplot(2,2,1), plot(year, relNums, l, p, 'o')

% findpeaks(relNums,year)
xlabel('Ano')
ylabel('# Mancha Solar')


[pks, locs] = findpeaks(relNums,year,'MinPeakProminence',40);
subplot(2,2,2), plot(year, relNums, locs, pks, 'o')
xlabel('Ano')
ylabel('# Mancha Solar')

peakInterval = diff(locs);
subplot(2,1,2), hist(peakInterval)
grid on
xlabel('Intervalo de Anos')
ylabel('Frequencia de Ocorrencia')




%% ======================= Ordena os Picos =======================
x = linspace(0,1,1000);

Pos = [1 2 3 5 7 8]/10;
Hgt = [4 4 4 2 2 3];
Wdt = [2 6 3 3 4 6]/100;

for n = 1:length(Pos)
    Gauss(n,:) =  Hgt(n)*exp(-((x - Pos(n))/Wdt(n)).^2);
end
PeakSig = sum(Gauss);

% Imprime o sinal
figure
subplot(2,2,1), plot(x,Gauss,'--',x,PeakSig)

% Busca os picos
[pks,locs] = findpeaks(PeakSig,x);
subplot(2,2,2), findpeaks(PeakSig,x)
% Coloca os rotulos dos picos
text(locs+.02,pks,num2str((1:numel(pks))'))

% Busca os picos (ordenacao)
[psor,lsor] = findpeaks(PeakSig,x,'SortStr','descend');
subplot(2,2,3), findpeaks(PeakSig,x)
text(lsor+.02,psor,num2str((1:numel(psor))'))



%% ======================= Proeminencias dos Picos =======================
x = linspace(0,1,1000);

base = 4*cos(2*pi*x);

Pos = [1 2 3 5 7 8]/10;
Hgt = [3 7 5 5 4 5];
Wdt = [1 3 3 4 2 3]/100;

for n = 1:length(Pos)
    Gauss(n,:) =  Hgt(n)*exp(-((x - Pos(n))/Wdt(n)).^2);
end
PeakSig = sum(Gauss)+base;

% Plota os sinais
figure,
subplot(1,2,1)
plot(x,Gauss,'--',x,PeakSig,x,base)

subplot(2,2,2)
findpeaks(PeakSig,x,'Annotate','extents')

subplot(2,2,4)
findpeaks(PeakSig,x,'MinPeakProminence',4,'Annotate','extents')

[pks,locs,widths,proms] = findpeaks(PeakSig,x);