function [output] = myCLAHE(input,w_size,clip)
%MYCLAHE Summary of this function goes here
%   Detailed explanation goes here
[row,col,numChannels] = size(input);

for k = 1:numChannels
    for i = 1:row
        for j = 1:col
            window = input(max(1,i-w_size):min(row,i+w_size),max(1,j-w_size):min(col,j+w_size));
            histogram = imhist(window);
            clip_value = clip*sum(histogram);
            clipped_area = sum(max(0,histogram-clip_value));
            histogram = min(histogram,clip_value);
            histogram = histogram + clipped_area/256;
            cum_hist = cumsum(histogram)/sum(histogram);
            output(i,j,k) = cum_hist(input(i,j,k) + 1);
            
           
        end
        
    end
    
end
        


end

