function [output] = myHM(input,reference)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
num_channels = size(input,3);
for i = 1:num_channels
    histChannel_inp = imhist(input(:,:,i),256);
    histChannel_ref = imhist(reference(:,:,i),256); 
    cdf_input(:,i) = cumsum(histChannel_inp);
    cdf_ref(:,i) = cumsum(histChannel_ref);
    start=1;
    for j = 1:256
        num_pixels = cdf_ref(j,i);
%         num_pixels
        if(start>num_pixels)
            continue
        end
%         start
        cdf_ref_inv(start:1:num_pixels,i)=j;
%         size(cdf_ref_inv,1)
        start=num_pixels+1;
    end
  
    temp_cdf = cdf_input(:,i);
    temp_output(:,:,i) = temp_cdf(input(:,:,i)+1);
%     temp_output(:,:,i)
    temp_cdf_inv = cdf_ref_inv(:,i);
%     size(temp_cdf_inv)
    output(:,:,i) = temp_cdf_inv(temp_output(:,:,i))-1;
    
end

end

