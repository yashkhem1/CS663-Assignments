%% MyMainScript

tic;
%% Your code here

image = imread('../data/flower.png');

%Uncomment below to downsample the image by a factor of two
% image = imresize(image, 1/2);
%
%% Optimal Parameter Values
%
%%
% 
% * Gaussian Kernel Bandwidth for color feature = 20
% * Gaussian Kernel Bandwidth for spatial feature = 100

final_img = myMeanShiftSegmentation(image, 20, 100, 15);

%% Flower
figure;
subplot(1,2,1);
imshow(uint8(image), 'DisplayRange', []);
title('Original Image');
subplot(1, 2, 2);
imshow(uint8(final_img), 'DisplayRange', []);
title('Segmented Image');

%Uncomment below to get segmented image for baboonColor.png
% %%
% image = imread('../data/baboonColor.png');
% image = imresize(image, 1/2);
% final_img = myMeanShiftSegmentation(image, 20, 100, 20);
% 
% %% Baboon
% figure;
% subplot(1,2,1);
% imshow(uint8(image), 'DisplayRange', []);
% title('Original Image');
% subplot(1, 2, 2);
% imshow(uint8(final_img), 'DisplayRange', []);
% title('Segmented Image');

toc;

