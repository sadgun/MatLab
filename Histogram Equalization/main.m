% Script to perform the global histogram equalization for an 
% input image without using the in-built function.
    
clear all;
clc;
tic;
    %% Read and display image
imageName = 'cameraman.tif';        % Image path
Input_image = imread(imageName);
[rows, columns, numberOfColorChannels] = size(Input_image);
if numberOfColorChannels > 1
  Input_image = rgb2gray(Input_image);
end
figure(1);
imshow(Input_image);
title('Original Image');
    %% Compute the global histogram equalization of the image
Output_Image = histogram_equalization(Input_image);
    %% Display image after global histogram equalization
figure(2);
imshow(Output_Image);
title('Image after global histogram equalization');
toc;