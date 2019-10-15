close all; clear; clc;

img = imread('lena.jpg');

w_name = 'db1';
[c,l] = wavedec2(img, 2, w_name);


% obtem os coeficientes
A2 = appcoef2(c,l, w_name, 2);
[H1, V1, D1] = detcoef2('all', c, l, 1);
[H2, V2, D2] = detcoef2('all', c, l, 2);

ndcode = 70; % melhora exibicao
H1 = wcodemat(H1, ndcode); V1 = wcodemat(V1, ndcode); 
D1 = wcodemat(D1, ndcode); 
A2 = wcodemat(A2, ndcode); H2 = wcodemat(H2, ndcode); 
V2 = wcodemat(V2, ndcode); D2 = wcodemat(D2, ndcode);

figure, image([[A2 H2; V2 D2] H1; V1 D1]), axis off
colormap('pink');
