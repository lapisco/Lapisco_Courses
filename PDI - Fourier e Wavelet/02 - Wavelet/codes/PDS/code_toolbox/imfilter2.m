function [ imgOut ] = imfilter2( imgIn, kernel)
%IMFILTER2 Summary of this function goes here
%   Detailed explanation goes here

isUint8 = false;
if(isa(imgIn,'uint8'))
    isUint8 = true;
end
imgIn = double(imgIn);

[rI,cI] = size(imgIn);
[rK,cK] = size(kernel);

% Adiciona linhas de 0
c = [zeros(floor(cK/2), cI); imgIn; zeros(floor(cK/2), cI)];

% Adiciona colunas de 0
c = [zeros(rI+rK-1, floor(rK/2)) c zeros(rI+rK-1, floor(rK/2))];

rows = 0:rK-1;
cols = 0:cK-1;

for i = 1:cI
   for j = 1:rI

       x = c(j+rows,i+cols);
       imgOut(j,i) = sum(sum(x.*kernel));
   end
end

if(isUint8)
    imgOut = uint8(imgOut);
end

end

