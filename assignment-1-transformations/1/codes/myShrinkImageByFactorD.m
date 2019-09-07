function [ shrunk_image ] = myShrinkImageByFactorD( image,d )
%myShrinkImageByFactorD Summary of this function goes here
%   Detailed explanation goes here
shrunk_image = image(1:d:end,1:d:end);
size(shrunk_image)
end

