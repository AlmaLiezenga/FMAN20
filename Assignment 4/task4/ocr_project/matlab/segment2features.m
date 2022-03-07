function features = segment2features(I)
%creating the bounding box for the number
stats = regionprops(I, 'BoundingBox');
BB = stats.BoundingBox;
cropped = imcrop(I, [BB(1), BB(2), BB(3), BB(4)]); 

%calculating regionprops on the cropped image
stats = regionprops(cropped, 'Circularity', 'EulerNumber');

%counting the relative amount of white pixels 
pixels = numel(cropped);
white = sum(cropped(:));
rel_white = white/pixels; 

%5 middle rows
y_mid = round(size(cropped,1)/2); 
white_rows = sum(sum(cropped(y_mid-2:y_mid+2,:)));
rel_rows_white = white_rows/pixels; 

%5 middle columns
x_mid = round(size(cropped,2)/2);
white_columns = sum(sum(cropped(:,x_mid-2:x_mid+2))); 
rel_columns_white = white_columns/pixels;

%proportional density upper-lower
y_end = round(size(cropped,1));
upperhalf = cropped(1:y_mid,:);
lowerhalf = cropped(y_mid:y_end,:);
upperhalfdensity = sum(sum(upperhalf)) / numel(upperhalf);
lowerhalfdensity = sum(sum(lowerhalf)) / numel(lowerhalf);
propupperlower = 5 * minus(upperhalfdensity, lowerhalfdensity); 

%proportional density left-right
x_end = round(size(cropped,2));
lefthalf = cropped(:,1:x_mid);
righthalf = cropped(:,x_mid:x_end);
lefthalfdensity = sum(sum(lefthalf)) / numel(lefthalf);
righthalfdensity = sum(sum(righthalf)) / numel(righthalf);
propleftright = 5 * minus(lefthalfdensity, righthalfdensity); 

%proportional density left lower 
leftlower = cropped(y_mid:y_end,1:x_mid);
leftlowerdensity = sum(sum(leftlower)) / numel(leftlower);
propll = 5 * minus(leftlowerdensity, rel_white); 

%proportional density left upper 
leftupper = cropped(1:y_mid,1:x_mid);
leftupperdensity = sum(sum(leftupper)) / numel(leftupper);
proplu = 5 * minus(leftupperdensity, rel_white); 

%proportional density right lower 
rightlower = cropped(y_mid:y_end,x_mid:x_end);
rightlowerdensity = sum(sum(rightlower)) / numel(rightlower);
proprl = 5 * minus(rightlowerdensity, rel_white); 

%proportional density right upper 
rightupper = cropped(1:y_mid,x_mid:x_end);
rightupperdensity = sum(sum(rightupper)) / numel(rightupper);
propru = 5 * minus(rightupperdensity, rel_white); 

%writing the features to the feature vector 
features = [rel_white, rel_rows_white, rel_columns_white, stats.Circularity, stats.EulerNumber, propupperlower, propleftright, propll, proplu, proprl, propru];