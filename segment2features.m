function features = segment2features(I)
%calculting region properties 
stats = regionprops(I, 'MinorAxisLength','Circularity','Eccentricity', 'Orientation', 'EulerNumber');

%counting the relative amount of white pixels 
pixels = numel(I);
white = sum(I(:));
rel_white = white/pixels; 
norm_white = (rel_white)*2/(0.07) - 1;

%normalize minor axis length 
norm_MinorAxisLength = (stats.MinorAxisLength-5)*2/(12) - 1;

%normalized circularity
norm_Circularity = (stats.Circularity-0.15)*2/(0.6) - 1; 

%normalized eccentricity 
norm_Eccentricity = (stats.Eccentricity-0.6)*2/(0.4) - 1;

%relative orientation 
rel_Orientation = stats.Orientation/180; 
norm_Orientation = (rel_Orientation+0.5)*2/(1) - 1;

%write features to the feature vector 
features = [norm_white, norm_MinorAxisLength, norm_Circularity, norm_Eccentricity, norm_Orientation, stats.EulerNumber]; 