function [ final_img ] = myPatchBasedFiltering( img, h)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    final_img = img;
    final_img = padarray(final_img, [4,4], 0, 'both');
    for i = 5:size(final_img, 1)-4
        for j = 5:size(final_img, 2)-4
                final_img(i, j) = patch_filtered_pix(i, j, final_img, h);
        end
    end
    final_img = final_img(5:size(final_img, 1)-4, 5:size(final_img, 2)-4);

end