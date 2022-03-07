function S = im2segment(im)

nrofsegments = 5;
S = cell(1,nrofsegments);
m = size(im,1);
n = size(im,2);

for kk = 1:nrofsegments
    %create an empty (black) matrix the same size as the original image
    segmentation = zeros(m,n);

    %calculate and extract the position of each separate segmentation
    n_segmentation = n/nrofsegments;
    col_start = 1+(kk-1)*n_segmentation;
    col_stop = col_start+n_segmentation-1;
    pixel = im(:,col_start:col_stop);
    
    %threshold the segmentation with a filter
    filter = fspecial('average', [36, 36]);
    avg_pixel = imfilter(pixel, filter); 
    subtract_pixel = pixel - (avg_pixel+20); 
    segmentation(:,col_start:col_stop) = im2bw(subtract_pixel,0);
    
    %neighbor kernel for filtering noise 
    neighborKernel = [1,1,1;1,0,1;1,1,1];
    nbrNeighbors = conv2(segmentation, neighborKernel, 'same');
    
    for c=1:n
        for r = 1:m 
            if nbrNeighbors(r, c) <= 2
                segmentation(r, c) = 0;
            elseif nbrNeighbors(r, c) >= 6
                segmentation(r, c) = 1;  
            end
        end
    end
    
    %write the new segmentation to the set S 
    S{kk} = segmentation;
end

