clc;
clear;
close All;


%read the image
img = imread('breaking-bad.jpg');

% gray-scale image
grayScaleImg = rgb2gray(img);

%generate noisy image
noisyImg = imnoise(img,'gaussian',0,0.25);

%generate fft image from gray-scale image
fft = fftshift(log(abs(fft2(grayScaleImg))));

% decomposition noisy rgb image chanells 
red_channel = noisyImg(:, :, 1);
green_channel = noisyImg(:, :, 2);
blue_channel = noisyImg(:, :, 3);

red_channel = medfilt2(red_channel, [7 7]);
green_channel = medfilt2(green_channel, [7 7]);
blue_channel = medfilt2(blue_channel, [7 7]);

%concatenate channels
noiseRemovalImg = cat(3, red_channel, green_channel, blue_channel);

%calcilate snr, peaksnr
[peaksnr, snr] = psnr(noiseRemovalImg, img);

%show images in figures:
figure, imshow(img);
title("source image");

figure, imshow(grayScaleImg);
title("gray-scale image");

figure, imshow(noisyImg);
title("noisy image");

figure, imshow(fft, []);
title("fft gray-scale image");

figure, imshow(noiseRemovalImg);
title("recovered noisy image");

fprintf('PSNR: %0.6f\n', peaksnr);
fprintf('SNR:  %0.6f \n', snr);

