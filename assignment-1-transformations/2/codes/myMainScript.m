%% MyMainScript

tic;
clf;
close all;
%% Your code here

%% Foreground Mask
% [statue, map] = imread('../data/statue.png');
% [final_statue,mask_statue] = myForegroundMask(statue);
% imshow(statue);
% figure,imshow(final_statue);
% figure,imshow(mask_statue);
% toc;

%% Linear Contrast Stretching
% % pathArray=['../data/barbara.png';'../data/TEM.png';'../data/canyon.png';'../data/church.png';'../data/chestXray.png'];
% % for i = 1:5
% %     path = pathArray(i);
% %     pathStr = strcat('../data/',path,'.png');
% %     pathStr = convertStringsToChars(pathStr);
%     colormap(jet(200));
%     [image_barbara,map] = imread('../data/barbara.png');
%     output_barbara = myLinearContrastStretching(image_barbara);
%     imshow(image_barbara),colorbar;
%     figure,imshow(mat2gray(output_barbara)),colorbar;
%     
%     [image_TEM,map] = imread('../data/TEM.png');
%     output_TEM = myLinearContrastStretching(image_TEM);
%     figure,imshow(image_TEM),colorbar;
%     figure,imshow(mat2gray(output_TEM)),colorbar;
%    
%     [image_canyon,map] = imread('../data/canyon.png');
%     output_canyon = myLinearContrastStretching(image_canyon);
%     imshow(image_canyon),colorbar;
%     figure,imshow(mat2gray(output_canyon)),colorbar;
%     
%     [image_church,map] = imread('../data/church.png');
%     output_church = myLinearContrastStretching(image_church);
%     figure,imshow(image_church),colorbar;
%     figure,imshow(mat2gray(output_church)),colorbar;
%     
%     [image_chest,map] = imread('../data/chestXray.png');
%     output_chest = myLinearContrastStretching(image_chest);
%     figure,imshow(image_chest),colorbar;
%     figure,imshow(mat2gray(output_chest)),colorbar;
%     
%     output_statue = myLinearContrastStretching(final_statue);
%     figure,imshow(final_statue),colorbar;
%     figure,imshow(mat2gray(output_statue)),colorbar;

%% Image Histogram
%    colormap(jet(200));
%     [image_barbara,map] = imread('../data/barbara.png');
%     output_barbara_HE = myHE(image_barbara);
%     imshow(image_barbara),colorbar;
%     figure,imshow(mat2gray(output_barbara_HE)),colorbar;
%     
%     [image_TEM,map] = imread('../data/TEM.png');
%     output_TEM_HE = myHE(image_TEM);
%     figure,imshow(image_TEM),colorbar;
%     figure,imshow(mat2gray(output_TEM_HE)),colorbar;
%    
%     [image_canyon,map] = imread('../data/canyon.png');
%     output_canyon_HE = myHE(image_canyon);
%     imshow(image_canyon),colorbar;
%     figure,imshow(mat2gray(output_canyon_HE)),colorbar;
%     
%     [image_church,map] = imread('../data/church.png');
%     output_church_HE = myHE(image_church);
%     figure,imshow(image_church),colorbar;
%     figure,imshow(mat2gray(output_church_HE)),colorbar;
%     
%     [image_chest,map] = imread('../data/chestXray.png');
%     output_chest_HE = myHE(image_chest);
%     figure,imshow(image_chest),colorbar;
%     figure,imshow(mat2gray(output_chest_HE)),colorbar;
%     
%     output_statue_HE = myHE(final_statue);
%     figure,imshow(final_statue),colorbar;
%     figure,imshow(mat2gray(output_statue_HE)),colorbar;
    
%% Histogram Matching
colormap(jet(200));
[image_ret,map] = imread('../data/retina.png');
[image_ret_ref,map] = imread('../data/retinaRef.png');
output_ret_ref = myHM(image_ret,image_ret_ref);
figure,imshow(image_ret),colorbar;
figure,imshow(image_ret_ref),colorbar;
figure,imshow(mat2gray(output_ret_ref)),colorbar;



