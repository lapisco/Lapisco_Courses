clear; clc; close all;


load(fullfile(matlabroot,'examples','signal','clock.mat'))

plot(tclock,clocksig)
xlabel('Time (s)')
ylabel('Level (V)')


levels = statelevels(clocksig)


statelevels(clocksig);


[Rise,LoTime,HiTime,LoLev,HiLev] = risetime(clocksig,tclock);

Levels = [LoLev HiLev; (levels(2)-levels(1))*[0.1 0.9]+levels(1)]


figure,
risetime(clocksig,Fs);



overshoot(clocksig,Fs);

[pctgs,values,times] = undershoot(clocksig,Fs);

hold on
text(1.1e-3,2,'     Undershoot','Background','w','Edge','k')
plot([times;1.17e-3],[values;2],'^m','HandleVisibility','off')
hold off