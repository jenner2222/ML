function idx = findClosestCentroids(X, centroids)
  
  %FINDCLOSESTCENTROIDS computes the centroid memberships for every example
  %   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
  %   in idx for a dataset X where each row is a single example. idx = m x 1 
  %   vector of centroid assignments (i.e. each entry in range [1..K])
  %
  
  % Set K
  K = size(centroids, 1);
  m = size(X,1);
  
  % You need to return the following variables correctly.
  idx = zeros(m, 1);
  
  distances = zeros(m, K);
  
  % idx(i) should contain the index of the centroid closest to example i.
  
  for i=1:K       % iterating over each centroid is faster than over each example
    diffs = bsxfun(@minus, X, centroids(i,:));
    centroid_to_example_distances = sum(diffs.^2, 2);
    distances(:,i) = centroid_to_example_distances;
  endfor
  
  [vals, idx] = min(distances,[],2);

end

