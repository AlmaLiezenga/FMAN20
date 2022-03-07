%loading the variables 
file = matfile('assignment1bases.mat');
stacks = file.stacks;
bases = file.bases;

%setting some parameters to enable looping through the dataset
nr_stacks = 2;
nr_images = 400;
nr_bases = 3;

%creating an empty array to store the er
norms = zeros(nr_stacks,nr_bases);

%looping through the stacks, images and bases 
for x = 1:nr_stacks 
    for z = 1:nr_bases 
        for y = 1:nr_images
            %looking up the image and base to process
            u = stacks{x}(:,:,y); 
            base = bases{z};
            %calling the projection function
            [up, r] = projection(u, base); 
            %adding the error norm to the total error norm
            norms(x,z) = norms(x,z) + r; 
        end
        %calculating the mean error norms
        norms(x,z) = norms(x,z)/nr_images;
    end 
end 

%displaying the mean error norms
display(norms); 
display(sum(norms, 'all')/6); 
