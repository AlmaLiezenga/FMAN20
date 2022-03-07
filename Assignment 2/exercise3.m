mu1 = 0.4; 
sigma1 = 0.01; 
mu2 = 0.3; 
sigma2 = 0.05;
mu3 = 0.5;
sigma3 = 0.2; 

observations1 = [0.4003, 0.3988, 0.3998, 0.3997, 0.4010, 0.3995, 0.3991]; 
observations2 = [0.2554, 0.3139, 0.2627, 0.3802, 0.3287, 0.3160, 0.2924];
observations3 = [0.5632, 0.7687, 0.0524, 0.7586, 0.4243, 0.5005, 0.6769];

%pred1 = normpdf(observations1, mu1, sigma1)
%pred2 = normpdf(observations2, mu2, sigma2)
pred3 = normpdf(observations3, mu2, sigma2)

