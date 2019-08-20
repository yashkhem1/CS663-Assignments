function [output] = myHE(input)
%MYHE Summary of this function goes here
%   Detailed explanation goes here
num_channels = size(input,3);
for i = 1:num_channels
    histChannel = imhist(input(:,:,i));
    cdf(:,i) = cumsum(histChannel)/sum(histChannel);
    temp = cdf(:,i);
    output(:,:,i) = temp(input(:,:,i)+1);
end


end

