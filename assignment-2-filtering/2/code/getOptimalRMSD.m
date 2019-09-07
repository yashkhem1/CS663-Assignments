function [ sigif, sigsf, min_rms ] = getOptimalRMSD( image, noisy_image, sigi, sigs)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    sigif = 0;
    sigsf = 0;
    min_rms = 100000.0;
    for i = sigi
        for j = sigs
    %         i
    %         j
            filtered_img = myBilateralFiltering(noisy_image, i, j, 6);
            rms = sqrt(sum(sum((filtered_img - double(image)).^2)))/(sqrt(size(noisy_image, 1)*size(noisy_image, 2)));
            if min_rms > rms
    %             rms
                min_rms = rms;
                sigif = i;
                sigsf = j;
            end
        end
    end

end