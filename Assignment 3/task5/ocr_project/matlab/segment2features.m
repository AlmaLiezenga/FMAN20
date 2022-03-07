function features = segment2features(I)
%creating a bounding box for the image 
stats = regionprops(I, 'BoundingBox');
BB = stats.BoundingBox;
cropped = imcrop(I, [BB(1), BB(2), BB(3), BB(4)]); 

%calculting region properties 
stats = regionprops(cropped, 'MinorAxisLength','Circularity', 'Orientation', 'EulerNumber');

%counting the relative amount of white pixels 
pixels = numel(cropped);
white = sum(cropped(:));
rel_white = white/pixels; 

%5 middle rows
y_mid = size(I,1)/2; 
white_rows = sum(sum(I(minus(y_mid,2):plus(y_mid,2),:)));
rel_rows_white = white_rows/pixels; 

%proportional density
y_end = size(I,1);
upperhalf = I(1:y_mid,:);
lowerhalf = I(y_mid:y_end,:);
upperhalfdensity = sum(sum(upperhalf)) / numel(upperhalf);
lowerhalfdensity = sum(sum(lowerhalf)) / numel(lowerhalf);
proportionaldensity = 5 * minus(upperhalfdensity, lowerhalfdensity); 

%proportional density left-right
x_mid = size(cropped,2)/2; 
x_end = size(cropped,2);
lefthalf = cropped(:,1:x_mid);
righthalf = cropped(:,x_mid:x_end);
lefthalfdensity = sum(sum(lefthalf)) / numel(lefthalf);
righthalfdensity = sum(sum(righthalf)) / numel(righthalf);
proportionaldensity2 = 5 * minus(lefthalfdensity, righthalfdensity); 

%writing the features to the feature vector 
features = [rel_white, stats.MinorAxisLength, stats.Circularity, stats.EulerNumber, proportionaldensity, proportionaldensity2, rel_rows_white]; 