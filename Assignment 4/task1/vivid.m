I = imread('arcimboldo_low.jpg');

vividI = hsv2rgb(rgb2hsv(I) .* cat(3, 1, 5, 1));

imshow(vividI)