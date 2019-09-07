%% MyMainScript

tic;
close all;
%% Bird.jpg
% For generating the foreground mask for the bird image we detect edges
% by finding the zeros of laplacian of gaussain of the image and then using
% the imfill function to fill the detected boundary. An additional manual
% mask is used to further restrict the foreground mask. The manual mask is a
% rough polynomial and the major smoothening is done automatically
bird = imread('../data/bird.jpg');
bird = imresize(bird,0.5); %%resizing image by 2 since it takes a lot of time
load('binary_bird.mat','binary_bird'); %%loading our manual rough mask
edge_bird = edge(bird(:,:,1),'log');
edge_fill_bird = imfill(edge_bird,'holes');
edge_fill_bird(binary_bird ==0)=0;
bird_fore = bird;
edge_fill_temp(:,:,1)=edge_fill_bird;
edge_fill_temp(:,:,2)=edge_fill_bird;
edge_fill_temp(:,:,3)=edge_fill_bird;
bird_fore(edge_fill_temp==0)=0;
bird_back = bird;
bird_back(edge_fill_temp~=0)=0;
figure;title('Segmentation of Bird');
subplot(1,3,1);imshow(mat2gray(edge_fill_bird));title('Foreground Mask');
subplot(1,3,2);imshow(mat2gray(bird_fore));title('Foreground Image');
subplot(1,3,3);imshow(mat2gray(bird_back));title('Background Image');
thresh_bird = 40;
dist_bird = bwdist(edge_fill_bird);
dist_bird(edge_fill_bird~=0) = 0;
dist_bird(dist_bird>thresh_bird) = thresh_bird;
figure;imcontour(dist_bird,100);title('Contour Plot for Bird');
[output_bird] = mySpatiallyVaryingKernel(bird,edge_fill_bird,thresh_bird,dist_bird);
k1 = fspecial('disk',0.2*thresh_bird);
k2 = fspecial('disk',0.4*thresh_bird);
k3 = fspecial('disk',0.6*thresh_bird);
k4 = fspecial('disk',0.8*thresh_bird);
k5 = fspecial('disk',thresh_bird);
figure;title('Kernels Used for Filtering')
subplot(3,2,1);imshow(mat2gray(k1));title('0.2*thresh');
subplot(3,2,2);imshow(mat2gray(k2));title('0.4*thresh');
subplot(3,2,3);imshow(mat2gray(k3));title('0.6*thresh');
subplot(3,2,4);imshow(mat2gray(k4));title('0.8*thresh');
positionVector = [0.35, 0.1, 0.35, 0.2];
subplot('Position',positionVector);imshow(mat2gray(k5));title('thresh');
figure;imshow(mat2gray(output_bird));title('Output Image for Bird');

%% Flower.jpg
% In case of flower image, we detect the foreground by first detecting the
% edges using the canny edge detection method. After that we manually join
% some points in the binary image in order to make use of the imfill
% function in Matlab

flower = imread('../data/flower.jpg');
edge_flower= edge(flower(:,:,3),'Canny',[0.25,0.7],2); %threshold low is 0.25, threshold high is 0.7 and variance of gaussian is 2
edge_flower([133;133;133;132;91;117],[183;184;185;185;209;249])=1; %%manually joining a few points
edge_fill_flower = imfill(edge_flower,'holes');
flower_fore = flower;
flower_back = flower;
edge_fill_temp_flower(:,:,1)=edge_fill_flower;
edge_fill_temp_flower(:,:,2)=edge_fill_flower;
edge_fill_temp_flower(:,:,3)=edge_fill_flower;
flower_fore(edge_fill_temp_flower==0)=0;
flower_back(edge_fill_temp_flower~=0)=0;
figure;title('Segmentation of Flower');
subplot(1,3,1);imshow(mat2gray(edge_fill_flower));title('Foreground Mask');
subplot(1,3,2);imshow(mat2gray(flower_fore));title('Foreground Image');
subplot(1,3,3);imshow(mat2gray(flower_back));title('Background Image');
thresh_flower = 20;
dist_flower = bwdist(edge_fill_flower);
dist_flower(edge_fill_flower~=0) = 0;
dist_flower(dist_flower>thresh_flower) = thresh_flower;
figure;imcontour(dist_flower,100);title('Contour Plot for Flower');
[output_flower] = mySpatiallyVaryingKernel(flower,edge_fill_flower,thresh_flower,dist_flower);
k1 = fspecial('disk',0.2*thresh_flower);
k2 = fspecial('disk',0.4*thresh_flower);
k3 = fspecial('disk',0.6*thresh_flower);
k4 = fspecial('disk',0.8*thresh_flower);
k5 = fspecial('disk',thresh_flower);
figure;title('Kernels Used for Filtering')
subplot(3,2,1);imshow(mat2gray(k1));title('0.2*thresh');
subplot(3,2,2);imshow(mat2gray(k2));title('0.4*thresh');
subplot(3,2,3);imshow(mat2gray(k3));title('0.6*thresh');
subplot(3,2,4);imshow(mat2gray(k4));title('0.8*thresh');
positionVector = [0.35, 0.1, 0.35, 0.2];
subplot('Position',positionVector);imshow(mat2gray(k5));title('thresh');
figure;imshow(mat2gray(output_flower));title('Output Image for Flower');

toc;
