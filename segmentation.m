%Image Segmentation

clc; close all; clear all;

originalImage = imread('coins.png');
%originalImage = rgb2gray(originalImage);
thresholdValue = 100;
binaryImage = originalImage > thresholdValue;
binaryImage = imfill(binaryImage, 'holes'); %for use with round objects

figure;
subplot(1,2,1);imshow(originalImage);title('Original Image');
subplot(1,2,2);imshow(binaryImage);title('Image Segmentation');
