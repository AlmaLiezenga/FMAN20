data = load('heart_data.mat'); 
chamber = data.chamber_values; 
background = data.background_values;

results = struct('chamber', fitdist(chamber, 'Normal'), 'background', fitdist(background, 'Normal')); 

n = size(data.im, 1);
m = size(data.im, 2);
image = data.im;

edges = edges4connected(n, m, 0); 

imreshaped = reshape(data.im, [n*m,1]); 
length = size(imreshaped,1); 

weight_graph = zeros(1, m*n, 4); 

length = 10; 
for r=1:length
    prob_chamber = normpdf(imreshaped(r), results.chamber.mu, results.chamber.sigma);
    prob_background = normpdf(imreshaped(r), results.background.mu, results.background.sigma);
    
    neighbours = find(edges(:,1) == r | edges(:,2) == r); 
    disp(r);
    for n=1:size(neighbours,1) 
        disp(neighbours(n));
        if neighbours(n) == imreshaped(r)+1 
            disp('this one is to the right of the pixel');
        elseif neighbours(n) == r-1
            disp('this one is to the left of the pixel');
        elseif neighbours(n) > r
            disp('this one is below the pixel')
        elseif neighbours(n) < r
            disp('this one is above the pixel')
        end
    end 
end
