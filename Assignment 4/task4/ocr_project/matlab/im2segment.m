function S = im2segment(im)

nrofsegments = 5;
S = cell(1,nrofsegments);
m = size(im,1);
n = size(im,2);

%threshold the segmentation with a filter
filter = fspecial('average', [36, 36]);
avg_pixel = imfilter(im, filter); 
subtract_pixel = im - (avg_pixel+15); 
im = imbinarize(subtract_pixel);

%neighbor kernel for filtering noise 
neighborKernel = [1,1,1;1,0,1;1,1,1];
nbrNeighbors = conv2(im, neighborKernel, 'same');
    
for c=1:n
    for r = 1:m 
        if nbrNeighbors(r, c) <= 1
            im(r, c) = 0;
        elseif nbrNeighbors(r, c) >= 7
            im(r, c) = 1;  
        end
    end
end

im = bwlabel(im);
[im,~] = imsegkmeans(uint8(im),nrofsegments + 1);
background = mode(mode(im));

for kk = 1:nrofsegments
    segmentation = zeros(m,n);    
     
    currentVal = 0;

    for c = 1:n
        for r = 1:m
            if im(r,c) ~= background && currentVal == 0
                currentVal = im(r,c);
            end
            if im(r,c) == currentVal
                segmentation(r,c) = 255;
                im(r,c) = background;
            else
                segmentation(r,c) = 0;
            end
        end
    end
    
    %write the new segmentation to the set S 
    S{kk} = segmentation; 
end

end