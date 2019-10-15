clear; close all; clc;
%% Exemplo de compressao com Wavelet 2D

X = imread('woman.png');

wname = 'haar';
level = 2;

% Compression parameters.
%------------------------
sorh = 'h';    % Specified soft or hard thresholding
thrSettings =  [...
    69.000000000000014     35.000000000000000 ; ...
    69.000000000000014     35.000000000000000 ; ...
    69.000000000000014     35.000000000000000   ...
    ];
roundFLAG = true;


% Compression using WDENCMP.
%--------------------------
[c,l] = wavedec2(X,level,wname);
[XCMP,cfsCMP,dimCFS] = wdencmp('lvd',c, l, ...
    wname,level,thrSettings,sorh);

if roundFLAG , XCMP = round(XCMP); end
if isequal(class(X),'uint8') , XCMP = uint8(XCMP); end


subplot(1,2,1), imshow(X)
subplot(1,2,2), imshow(XCMP)

fprintf('Number of zeros: %.2f\n', 100*sum(cfsCMP == 0)/length(cfsCMP))