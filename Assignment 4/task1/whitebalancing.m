I = imread('michelangelo_shift.jpg');

m = size(I, 1);
n = size(I, 2); 
colors = 3;
meangray = mean2(I); 

for c=1:colors
    channel = I(:,:,c);
    mean_channel = mean2(channel); 
    factor =  meangray / mean_channel ; 
    display(factor)
    
    I(:,:,c) = I(:,:,c) * factor;
end

imshow(I)
