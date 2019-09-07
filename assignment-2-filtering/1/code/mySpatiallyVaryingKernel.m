function [output] = mySpatiallyVaryingKernel(input,mask,threshold,dist_mat)
%MY Summary of this function goes here
%   Detailed explanation goes here
input = im2double(input);
[row,col,nChannels] = size(input);
% dist_mat = bwdist(mask);
% dist_mat(mask~=0) = 0;
% dist_mat(dist_mat>threshold)=threshold;
% figure,imagesc(dist_mat)
% contour_plot = contourc(double(dist_mat),100);
% contour(dist_mat,100);
output= zeros(size(input));
input_padded = padarray(input,[threshold,threshold],'replicate');
for i = 1:row
    for j = 1:col
        if(mask(i,j)~=0)
            output(i,j,:)=input(i,j,:);
            continue;
        end
        i_pad = i+threshold;
        j_pad = j+threshold;
        thresh = double(dist_mat(i,j));
%             display(thresh);
        kernel = fspecial('disk',thresh);
        thresh_size = (size(kernel,1)-1)/2;
        img_temp = input_padded(i_pad-thresh_size:i_pad+thresh_size,j_pad-thresh_size:j_pad+thresh_size,:); 
        output(i,j,:) = convn(img_temp,kernel,'valid');
        
    end
end

% figure;imshow(mat2gray(output));

end
    
