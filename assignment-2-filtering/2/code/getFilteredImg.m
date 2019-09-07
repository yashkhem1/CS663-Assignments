function [filtered_img, img] = getFilteredImg( image, sigif, sigsf)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    noise_dev = max(max(image)) - min(min(image));
    gaussian_noise = (double(noise_dev)/20) * randn(size(image, 1), size(image, 2));
    img = double(image) + gaussian_noise;
    
    filtered_img = myBilateralFiltering(img, sigif, sigsf, 6);

end