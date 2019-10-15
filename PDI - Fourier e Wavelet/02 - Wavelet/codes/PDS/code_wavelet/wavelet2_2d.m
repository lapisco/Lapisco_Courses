close all; clear; clc;

img = imread('lena.jpg');

% Computa a wavelet 2D
[CA, CH, CV, CD] = dwt2(im2double(img),'haar');

% Mostra o cofeciente de aprox e detalhes
ndcode = 70;
CA1 = wcodemat(CA,ndcode); %wcodemat ajuda na exibicao
CH1 = wcodemat(CH,ndcode);
CV1 = wcodemat(CV,ndcode);
CD1 = wcodemat(CD,ndcode);

figure, imshow([CA CH; CV CD],'Colormap',pink)
figure, image([CA1 CH1; CV1 CD1]), axis off
colormap('pink');

imgF = idwt2(CA, CH, CV, CD, 'haar');
figure, 
subplot(1,2,1), imshow(img)
subplot(1,2,2), imshow(imgF)

%wavemenu