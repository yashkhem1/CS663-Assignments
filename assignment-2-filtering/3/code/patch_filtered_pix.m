function [ pix ] = patch_filtered_pix( x, y, img, h )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%     patch_size = 9;
    window_size = 21;
    pix = 0.0;
    patch_init = img(round(max(1, x-4)):round(min(x+4, size(img, 1))), round(max(1, y-4)):round(min(y+4, size(img, 2))));
    filter = fspecial('gaussian', [9, 9], 2); 
    normalization = 0.0;
    for i = round(max(5, x-window_size/2)):round(min(x+window_size/2, size(img, 1)-4))
        for j = round(max(5, y-window_size/2)):round(min(y+window_size/2, size(img, 2)-4))
                patch = img(round(max(1, i-4)):round(min(i+4, size(img, 1))), round(max(1, j-4)):round(min(j+4, size(img, 2))));
                gauss_diff = (patch - patch_init).*filter;
                norm_dist = sum(sum((gauss_diff).^2));
                gaussian_dist = exp(-double(norm_dist)/double(h^2));
                normalization = normalization + gaussian_dist;
                pix = pix + gaussian_dist*img(i, j);
        end
    end
    pix = pix / normalization;

end