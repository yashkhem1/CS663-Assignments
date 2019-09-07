tic;
%% Your code here
image = imread('../data/grass.png');

%% Generate filtered image using the given values of sigma-intensity and sigma-space
[filtered_img, img] = getFilteredImg(image, 23, 2);

%% Uncomment this line to get optimal RMSD for grass.png and similarily for other images
% [ sigif, sigsf, min_rms ] = getOptimalRMSD(image, img, 1:30, 2:4);

%% Grass
%%
% The optimal sigma intensity was found to be 23 and optimal sigma space as
% 2. The optimal value of rms is 8.2109
%%
% * The value of rmsd at 0.9sigma_space and sigma_int = 8.0526 
% * The value of rmsd at 0.9sigma_space and sigma_int = 8.2950
% * The value of rmsd at 0.9sigma_space and sigma_int = 8.0663
% * The value of rmsd at 0.9sigma_space and sigma_int = 8.2887

figure('Renderer', 'painters', 'Position',[10 10 900 600]);
subplot(1,3,1);
imshow(uint8(image), 'DisplayRange', []);
title('Original Image');
subplot(1, 3, 2);
imshow(uint8(img), 'DisplayRange', []);
title('Corrupted Image');
x = subplot(1, 3, 3);
pos = get(x, 'position');
imshow(uint8(filtered_img), 'DisplayRange', []);
title('Filtered Image');
colorbar;
set(x, 'position', pos);
% suptitle('Grass');


%% HoneyComb
%%
% The optimal sigma intensity was found to be 27 and optimal sigma space as
% 2. The optimal value of rmsd is 7.85
%%
% * The value of rmsd at 0.9sigma_space and sigma_int = 3.3067 
% * The value of rmsd at 0.9sigma_space and sigma_int = 3.3109
% * The value of rmsd at 0.9sigma_space and sigma_int = 3.362
% * The value of rmsd at 0.9sigma_space and sigma_int = 3.3027
image = imread('../data/honeyCombReal.png');

[filtered_img, img] = getFilteredImg(image, 27, 2);


figure('Renderer', 'painters', 'Position',[10 10 900 600]);
subplot(1,3,1);
imshow(uint8(image), 'DisplayRange', []);
title('Original Image');
subplot(1, 3, 2);
imshow(uint8(img), 'DisplayRange', []);
title('Corrupted Image');
x = subplot(1, 3, 3);
pos = get(x, 'position');
imshow(uint8(filtered_img), 'DisplayRange', []);
title('Filtered Image');
colorbar;
set(x, 'position', pos);
% suptitle('HoneyComb');


%% Barbara
%%
% The optimal sigma intensity was found to be 9 and optimal sigma space as
% 2. The optimal value of rmsd is 3.3058
%%
% * The value of rmsd at 0.9sigma_space and sigma_int = 7.7455
% * The value of rmsd at 0.9sigma_space and sigma_int = 7.9437
% * The value of rmsd at 0.9sigma_space and sigma_int = 7.9015
% * The value of rmsd at 0.9sigma_space and sigma_int = 7.9017


image = load('../data/barbara.mat');
image = image.imageOrig;

[filtered_img, img] = getFilteredImg(image, 9, 2);


figure('Renderer', 'painters', 'Position',[10 10 900 600]);
subplot(1,3,1);
imshow(uint8(image), 'DisplayRange', []);
title('Original Image');
subplot(1, 3, 2);
imshow(uint8(img), 'DisplayRange', []);
title('Corrupted Image');
x = subplot(1, 3, 3);
pos = get(x, 'position');
imshow(uint8(filtered_img), 'DisplayRange', []);
title('Filtered Image');
colorbar;
set(x, 'position', pos);
% suptitle('Barbara');


%% Spatial Gaussian
window = 21;
centre = window/2;
spatial_gaussian = zeros(window, window);
for i = 1:window
    for j = 1:window
        spatial_gaussian(i, j) = 255*exp(-(((i - centre)^2 + (j - centre)^2)/(2*((2^2)))));
    end
end
spatial_gaussian = imresize(spatial_gaussian, [256, 256]);
figure;
imshow(uint8(spatial_gaussian));
colorbar;



toc;