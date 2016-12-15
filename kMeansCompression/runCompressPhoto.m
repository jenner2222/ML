%  Load an image
filename = 'environment-1870007_960_720.jpg';
originalImg = double(imread(filename));

% Compress the image
k = 16;
numIters = 25;
outputImage = compressPhoto(originalImg, k, numIters);

% Display the original image 
subplot(1, 2, 1);
imagesc(originalImg); 
title('Original');

% Display compressed image side by side
subplot(1, 2, 2);
imagesc(outputImage)
title(sprintf('Compressed, with %d colors.', k));

%imwrite(outputImage, ["mod-" filename]);