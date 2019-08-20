%% MyMainScript
tic;
%% Your code here
% myNumOfColors = 200;
% myColorScale = [ [0:1/(myNumOfColors-1):1]', [0:1/(myNumOfColors-1):1]', [0:1/(myNumOfColors-1):1]'];
%% Part (a)
circles = imread('../data/circles_concentric.png');
circles_shrunk2 = myShrinkImageByFactorD(circles,2);
circles_shrunk3 = myShrinkImageByFactorD(circles,3);

% colormap (myColorScale);
% colormap jet;

%display image 1
figure,imshow(circles);
% daspect ([1 1 1]);
% axis tight
% colorbar
%display image 2
figure,imshow(circles_shrunk2);
% daspect ([1 1 1]);
% axis tight
% colorbar
%display image 3
figure,imshow(circles_shrunk3);
% daspect ([1 1 1]);
% axis tight;
% colorbar
%% Part (b)
barbara = imread('../data/barbaraSmall.png');
barbara_zoomed = myBilinearInterpolation(barbara);
% barbara_zoomed
% figure,imshow(barbara);
figure,imshow(mat2gray(barbara_zoomed));
% colorbar

%% Part (c)
barbara_nearest = myNearestNeighborInterpolation(barbara);
% barbara_nearest
figure,imshow(mat2gray(barbara_nearest));
% colorbar
toc;
