clear; clc; close all;

whaleFile = fullfile(matlabroot,'examples','matlab','bluewhale.au');
[w,fs] = audioread(whaleFile);
% soundsc(w,fs)

% whale = timetable(seconds((0:length(w)-1)'/fs),w);
