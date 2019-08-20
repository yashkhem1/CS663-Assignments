function [ zoomed_image] = myNearestNeighborInterpolation( input_image )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[M,N] = size(input_image);
new_row = 3*M-2;
new_col = 2*N-1;
zoomed_image = zeros(new_row,new_col);
zoomed_image(1:3:end,1:2:end) = input_image;  
z1 = zeros(1,N+1);
z2 = zeros(M,1);
input_image = [input_image , z2 ; z1];
for i = 1:new_row
    x1 = floor((i-1)/3)+1;
    x2 = x1 + 1;
    delx1 = (i+2)/3 - x1;
    delx2 = x2 - (i+2)/3;
    for j = 1:new_col
        y1 = floor((j-1)/2)+1;
        y2 = y1 + 1;
        dely1 = (j+1)/2 - y1;
        dely2 = y2 - (j+1)/2;
        delArray = [delx1*dely1,delx1*dely2,delx2*dely1,delx2*dely2];
        iArray = [input_image(x1,y1), input_image(x1,y2), input_image(x2,y1), input_image(x2,y2)];
        [elem,index] = min(delArray);
        zoomed_image(i,j) = iArray(index);
        
%         zoomed_image(i,j) = input_image(x1,y1)*delx2*dely2 + input_image(x1,y2)*delx2*dely1 + input_image(x2,y1)*delx1*dely2 + input_image(x2,y2)*delx1*dely1;
        
        
        
    end
end

% zoomed_image
            
end


