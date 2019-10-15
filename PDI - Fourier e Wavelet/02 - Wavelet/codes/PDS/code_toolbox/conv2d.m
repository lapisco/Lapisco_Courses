close all; clear; clc;

%% Caso 1
img = [2 2 2 3; 2 1 3 3; 2 2 1 2; 1 3 2 2];
mask = [1 1 1; -1 2 1; -1 -1 1];

imgF = imfilter2(img, mask);
display(imgF)




%% Caso 2
img = imread('coins.png');

mask = fspecial2('average', 7);
imgF = imfilter2(img,mask);

imshow([img imgF])