%% Return a compressed image from a supplied image using K-Means clustering
function [compressedImage] = compressImage(originalImage, k=16, maxIterations=50)
  %%
  % Required Inputs:
  %   originalImage - A matrix representation of an image such as provided by 
  %     imread e.g., image = double(imread('file.jpg'))
  %   k - the number of clusters to be used to compress the image
  %%
  
  % Divide by 255 so that all values are in the range 0 - 1
  originalImage = originalImage / 255;
  
  % Size of the image
  img_size = size(originalImage);
  
  % Reshape the image into an Nx3 matrix where N = number of pixels.
  % Each row will contain the Red, Green and Blue pixel values
  % This gives us our dataset matrix X that we will use K-Means on.
  X = reshape(originalImage, img_size(1) * img_size(2), 3);
  
  % When using K-Means, it is important the initialize the centroids
  % randomly. 
  initial_centroids = kMeansInitCentroids(X, k);
  
  % Run K-Means
  [centroids, idx] = runkMeans(X, initial_centroids, maxIterations);
  
  % Find closest cluster members
  idx = findClosestCentroids(X, centroids);
  
  % Essentially, now we have represented the image X as in terms of the
  % indices in idx. 
  
  % We can now recover the image from the indices (idx) by mapping each pixel
  % (specified by it's index in idx) to the centroid value
  X_recovered = centroids(idx,:);
  
  % Reshape the recovered image into proper dimensions
  compressedImage = reshape(X_recovered, img_size(1), img_size(2), 3);
end