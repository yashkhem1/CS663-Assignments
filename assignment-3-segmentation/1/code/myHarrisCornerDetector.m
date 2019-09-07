function [Ix,Iy,e1,e2,cornerness,C] = myHarrisCornerDetector(input,sigma_1,sigma_2,k)
%MYHARRIS Summary of this function goes here
%   Detailed explanation goes here
[row,col,~] = size(input);

%% Scaling the input image to [0,1]
maxI = max(max(input));
minI = min(min(input));
input = (input-minI)/(maxI-minI);

%% Smootheining of Image
gaussian_image = fspecial('gaussian',[round(6*sigma_1 +1),round(6*sigma_1 +1) ],sigma_1);
filtered_image = imfilter(input,gaussian_image,'same'); 

%% Calculation of Gradients
[Ix,Iy] = imgradientxy(filtered_image);
Ix2 = Ix.^2;
Ixy = Ix.*Iy;
Iy2 = Iy.^2;

%% Structure Tensor Calculation
gaussian_harris = fspecial('gaussian',[round(6*sigma_2 +1), round(6*sigma_2 +1)],sigma_2);
Ix2_h = imfilter(Ix2,gaussian_harris,'same'); %%Harris Corner Algorithm
Iy2_h = imfilter(Iy2,gaussian_harris,'same');
Ixy_h = imfilter(Ixy,gaussian_harris,'same');


%% Calculating the Eigen Values using Quadratic Formula
f1 = (Ix2_h + Iy2_h)/2;
f2 = sqrt((Ix2_h-Iy2_h).^2 + 4*Ixy_h.^2)/2;
e1 = f1+f2;
e2 = f1-f2;

%% Cornerness Measure
cornerness  = Ix2_h.*Iy2_h - Ixy_h.^2 - k*((Ix2_h+Iy2_h).^2);

%% Non-maximal Suppression
C = zeros(size(cornerness));
for i=2:row-1
    for j=2:col-1
        window = cornerness(i-1:i+1,j-1:j+1);
        if cornerness(i,j) == max(max(window))
            C(i,j) = cornerness(i,j);
        end
        
    end
end

end
