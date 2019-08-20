function [ final,mask] = myForegroundMask( original)
%MYFOREGROUNDMASK Summary of this function goes here
%   Detailed explanation goes her
mask = zeros(size(original));
mask(original>15) = 255;
final = original;
final(mask==0) = 0;
end

