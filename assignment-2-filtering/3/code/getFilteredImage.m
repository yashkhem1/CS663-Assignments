function [ final_img, img, downsampled_img ] = getFilteredImage( image, h )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    imageBlur = imgaussfilt(image, 0.66);
    downsampled_img = double(imresize(imageBlur, 1/2));
    noise_dev = max(max(downsampled_img)) - min(min(downsampled_img));
    gaussian_noise = (noise_dev/20) * randn(size(downsampled_img, 1), size(downsampled_img, 2));
    img = double(downsampled_img) + gaussian_noise;
    final_img = myPatchBasedFiltering(img, h);

end

