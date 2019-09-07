function [output] = myHE(input)
%MYHE Summary of this function goes here
%   Detailed explanation goes here
num_channels = size(input,3);
for i = 1:num_channels
    histChannel = imhist(input(:,:,i),256);
    cdf = cumsum(histChannel)/sum(histChannel);
    output(:,:,i) = cdf(input(:,:,i)+1);
end


end

