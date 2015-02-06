% Script to perform the global histogram equalization for an 
% input image without using the in-built function.
    
clear all;
clc;
tic;
    %% Read and display image
imageName = 'cloudgate.jpg';        % Image path
Input_image = imread(imageName);
Input_image = rgb2gray(Input_image);
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