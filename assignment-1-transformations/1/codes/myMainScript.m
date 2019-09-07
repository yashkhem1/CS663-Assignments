%% MyMainScript
tic;
close all;

%Initial code for changing the default colormap
myNumOfColors = 200; 
colorScale = 0:1/(myNumOfColors-1):1;
myColorScale = [ colorScale' colorScale' colorScale' ]; 

%% Image Shrinking
circles = imread('../data/circles_concentric.png');
circles_shrunk2 = myShrinkImageByFactorD(circles,2);
circles_shrunk3 = myShrinkImageByFactorD(circles,3);
figure,imagesc(circles),colormap(myColorScale),title('Original Image'),daspect([1 1 1]),colorbar;
figure,imagesc(circles_shrunk2),colormap(myColorScale),title('Shrunk by factor d=2'),daspect([1 1 1]),colorbar;
figure,imagesc(circles_shrunk3),colormap(myColorScale),title('Shrunk by factor d=3'),daspect([1 1 1]),colorbar;

%% Image Enlargement using Bilinear Interpolation
barbara = imread('../data/barbaraSmall.png');
barbara_bilinear = myBilinearInterpolation(barbara);
figure,imagesc(barbara),colormap(myColorScale),title('Original Image'),daspect([1 1 1]),colorbar;
figure,imagesc(barbara_bilinear),colormap(myColorScale),title('Enlarged using Bilinear Interpolation'),daspect([1 1 1]),colorbar;

%% Image Enlargement using Nearest-Neighbor Interpolation
barbara_nearest = myNearestNeighborInterpolation(barbara);
figure,imagesc(barbara),colormap(myColorScale),title('Original Image'),daspect([1 1 1]),colorbar;
figure,imagesc(barbara_nearest),colormap(myColorScale),title('Enlarged using Nearest Neighbour'),daspect([1 1 1]),colorbar;
toc;
