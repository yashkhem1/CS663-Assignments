function [output] = myLinearContrastStretching(input)
%MYLINEARCONTRASTSTRETCHING Summary of this function goes here
%   Detailed explanation goes here
% input = im2double(input);
% input
input = im2double(input);
num_channels = size(input,3);
for i = 1:num_channels       
    min_intensity = min(min(input(:,:,i)));
    max_intensity = max(max(input(:,:,i)));
    output(:,:,i) = (input(:,:,i)-min_intensity)*255./(max_intensity-min_intensity);
    

    
end

