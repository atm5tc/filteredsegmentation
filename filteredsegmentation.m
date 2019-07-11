%% Gabor Filterbanks & K-Means Image Segmentation
% Austin Martin - Atm5tc@virginia.edu

% Clear figures, enter workspace, read images
clear all; close all;
cd '~/Documents/UVA 2018/ECE 4501/HW6';
brodatz4 = imread('brodatz4.png');
brodatz5 = imread('brodatz5.jpg');

%% Gabor Filterbank with two filters in 2D
% A bank of two filters was implemented for each image
% Careful selection of lambda/sigma/rotation was necessary to make sure
% filter spaces did not overlap
% Brodatz4, lambda = [2.25, 3.25] sigma = [1.75, 3], up = [3 1]*pi/4
% Brodatz5, lambda = [4  , 4  ] sigma = [2.6, 1.5], up = [3 1]*pi/4
inpic = mat2gray(brodatz4); % Convert to gray
outpic = gb2d(inpic,2.25,1.75,3*pi/4); % Filter one
outpic = outpic + gb2d(inpic,3.25,3,pi/4); % Filter two
subplot(3,1,1);
imshow(abs(outpic)); % Show Filter
subplot(3,1,2);
imshow(log(abs(fftshift(fft2(outpic)))+1)); % Show FFT of filter
subplot(3,1,3);
outpic = imfilter(inpic,outpic,'symmetric'); 
imshow(abs(outpic)); % Show Filtered brodatz img
%% K Means Image Segmentation
% No kmeans of image function in my older version of matlab, using old k means
% and a contour plot
k = kmeans(im2double(outpic(:)),5);
k = reshape(k,size(outpic));

close all;
figure;
%imshow(mat2gray(k), 'Colormap', colormap(copper));
contourf(k(:,:,1));
colormap(jet(256));

%%