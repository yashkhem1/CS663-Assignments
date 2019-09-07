function [ final_img ] = myMeanShiftSegmentation( img, hr, hs, numIter)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [a, b, c] = size(img);
    n = a*b;
    window = 2*sqrt(n);
    temp_img = reshape(img, n, c);
    [R, C] = ndgrid(1:a, 1:b);
    indices = zeros(size(R, 1), size(R, 2) , 2);
    indices(:, :, 1) = R;
    indices(:, :, 2) = C;
    indices = reshape(indices, n, 2);
    joint = zeros(n, c+2);
    joint(:, 1:c) = temp_img;
    joint(:, c+1:c+2) = indices;
    hr = double(hr);
    hs = double(hs);
    for i = 1:numIter
       nn = knnsearch(double(joint), double(joint), 'k', window);
       for j = 1:n
           color_kernel = exp(-(sum(bsxfun(@minus, joint(nn(j, :), 1:c), joint(j, 1:c)).^2, 2))/(2*hr^2));
           space_kernel = exp(-(sum(bsxfun(@minus, joint(nn(j, :), c+1:c+2), joint(j, c+1:c+2)).^2, 2))/(2*hs^2));
           joint_kernel = color_kernel.*space_kernel;
           new_mean = sum(bsxfun(@times, joint(nn(j, :), 1:c), joint_kernel))./(sum(joint_kernel));
           joint(j, 1:c) = new_mean;
       end
    end
    final_img = joint(:, 1:c);
    final_img = reshape(final_img, a, b, c);

end

