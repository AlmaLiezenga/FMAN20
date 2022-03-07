function features = segment2features(I)
%calculting region properties 
stats = regionprops(I, 'BoundingBox');

%creating a bounding box for the image 
BB = stats.BoundingBox;
cropped = imcrop(I, [BB(1), BB(2), BB(3), BB(4)]); 

stats = regionprops(cropped, 'MinorAxisLength','Circularity','Eccentricity', 'Orientation', 'EulerNumber');

%counting the relative amount of white pixels 
pixels = numel(cropped);
white = sum(cropped(:));
rel_white = white/pixels; 
norm_white = (rel_white)*2/(0.07) - 1;

%normalizing the minor axis length 
norm_MinorAxisLength = (stats.MinorAxisLength-5)*2/(12) - 1;

%normalizing the circularity
norm_Circularity = (stats.Circularity-0.15)*2/(0.6) - 1; 

%normalizing the eccentricity 
norm_Eccentricity = (stats.Eccentricity-0.6)*2/(0.4) - 1;

%normalizing the orientation
rel_Orientation = stats.Orientation/180; 
norm_Orientation = (rel_Orientation+0.5)*2/(1) - 1;

%5 middle rows
y_mid = size(cropped,1)/2; 
white_rows = sum(sum(cropped(y_mid-2:y_mid+2,:)));
rel_rows_white = white_rows/pixels; 

%proportional density upper-lower
y_end = size(cropped,1);
upperhalf = cropped(1:y_mid,:);
lowerhalf = cropped(y_mid:y_end,:);
upperhalfdensity = sum(sum(upperhalf)) / numel(upperhalf);
lowerhalfdensity = sum(sum(lowerhalf)) / numel(lowerhalf);
proportionaldensity = 5 * (upperhalfdensity - lowerhalfdensity); 

%proportional density left-right
x_mid = size(cropped,2)/2; 
x_end = size(cropped,2);
lefthalf = cropped(:,1:x_mid);
righthalf = cropped(:,x_mid:x_end);
lefthalfdensity = sum(sum(lefthalf)) / numel(lefthalf);
righthalfdensity = sum(sum(righthalf)) / numel(righthalf);
proportionaldensity2 = 5 * (lefthalfdensity - righthalfdensity); 

%writing the features to the feature vector 
features = [rel_white, norm_MinorAxisLength, norm_Circularity, stats.EulerNumber, proportionaldensity, proportionaldensity2, rel_rows_white]; 