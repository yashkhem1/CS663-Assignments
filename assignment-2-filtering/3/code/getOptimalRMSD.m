function [ hf, min_rms ] = getOptimalRMSD( image, noisy_image, h)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    hf = 0;
    min_rms = 100000.0;
    for i = h
        filtered_img = myPatchBasedFiltering(noisy_image, i);
        rms = sqrt(sum(sum((filtered_img - double(image)).^2)))/(sqrt(size(noisy_image, 1)*size(noisy_image, 2)));
        if min_rms > rms
            min_rms = rms;
            hf = i;
        end
    end

end