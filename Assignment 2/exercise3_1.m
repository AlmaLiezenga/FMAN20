training1 = [0.4003, 0.3988, 0.3998, 0.3997];
training2 = [0.2554, 0.3139, 0.2627, 0.3802];
training3 = [0.5632, 0.7687, 0.0524, 0.7586];

observations1 = [0.4010, 0.3995, 0.3991]; 
observations2 = [0.3287, 0.3160, 0.2924];
observations3 = [0.4243, 0.5005, 0.6769];

for 
scores(c,1) = prob_total + log(classification_data.(index)(1,nrfeatures+1)); 

[~, index] = max(scores);
y(1,s) = index; 