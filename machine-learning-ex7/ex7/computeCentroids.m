function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);
cluster_sum = zeros(K,n); % This matrix represents the sum of all points presented in a cluster
cluster_count = zeros(K); % This vector will store the count of points allocated to each cluster


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%
for i = 1: size(X,1)
  cluster_indx = idx(i);
  cluster_count(cluster_indx)++ ;
  
  for j = 1: size(X,2)
    cluster_sum(cluster_indx, j) += X(i,j);
  end
 end  

for i = 1:K
  centroids(i,:) = cluster_sum(i,:)/cluster_count(i);
end

% =============================================================
end

