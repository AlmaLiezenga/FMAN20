load('heart_data.mat');

mean_background = mean(background_values);
std_background = std(background_values);

mean_chamber = mean(chamber_values);
std_chamber = std(chamber_values);

[height, width] = size(im);

edges = edges8connected(width, height);

A = zeros(height*width, height*width);
T = zeros(height*width, 2);

for v = 1:height*width 
    neighbours_indices = find(edges(:,1) == v| edges(:,2) == v); 
    neighbours = zeros(1, max(size(neighbours_indices))); 
    
    for i=1:max(size(neighbours_indices))
        neighbours(i) = edges(neighbours_indices(i)); 
    end 
    
    for n=1:max(size(neighbours))
        neighbour = neighbours(n);
        difference = im(v) - im(neighbour); 
        A(v,neighbour) = difference;
    end
    
    T(v,1) = -log( (1/sqrt(2*pi*(std_chamber)^2))*exp(-((im(v)-mean_chamber)^2/(40*std_chamber^2))) );
    T(v,2) = -log( (1/sqrt(2*pi*(std_background)^2))*exp(-((im(v)-mean_background)^2/(40*std_background^2))) );
end

A = sparse(A);
T = sparse(T);

[E Theta] = maxflow(A,T); 

Theta = reshape(Theta ,height,width); 
Theta = double(Theta);

%extra: connected component and filling to improve segmentation
CC = bwconncomp(Theta);
for c = 1:CC.NumObjects
   if max(size(CC.PixelIdxList{c})) < 150
       Theta(CC.PixelIdxList{c}) = 0;
   end
end

Theta = imfill(Theta, 'holes');

%show the final image
imshow(Theta)