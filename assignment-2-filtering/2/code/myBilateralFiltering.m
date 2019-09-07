function [ final_img ] = myBilateralFiltering( img, sigi, sigs, window_size)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    final_img = zeros(size(img, 1), size(img, 2));
    for i = 1:size(final_img, 1)
        for j = 1:size(final_img, 2)
            final_pix = 0;
            wp = 0;
            for k = 1:7
                for l = 1:7
                    x = round(i + k - window_size/2);
                    y = round(j + l - window_size/2);
                    if x > 0 && y > 0 && x < size(final_img, 1) && y < size(final_img, 2)
                        g1 = exp(-((img(x, y) - img(i, j))^2)/(2*double(sigi^2)));
                        g2 = exp(-((x-i)^2 + (y-j)^2)/(2*double(sigs^2)));
                        final_pix = final_pix + img(x, y)*g1*g2;
                        wp = wp + g1*g2;
                    end 
                end
            end
            final_img(i, j) = final_pix/wp;
        end
    end
    
end