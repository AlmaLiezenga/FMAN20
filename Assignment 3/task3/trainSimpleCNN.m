function net = trainSimpleCNN(X,Y)
% function net = trainSimpleCNN(X,Y)


% reformat input data
% input images assumed to be 19x19
nx = 19; 
ny = 19;
X = reshape(X,ny,nx,1,[]);

% classes should be of type categorical
Y = categorical(Y);

% define cnn-structure
layers = [
    imageInputLayer([ny nx 1])
    
    %convolution layer reducing image size
    convolution2dLayer(3,8,'Padding','same')
    %fit to Gaussian distribution 
    batchNormalizationLayer
    %thresholding layer to set all values below zero to zero 
    reluLayer
    
    %reduces size by taking the highest value from the area covered by
    %the kernel
    maxPooling2dLayer(2,'Stride',2)
    
    %same as before 
    convolution2dLayer(3,16,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    fullyConnectedLayer(2)
    softmaxLayer
    classificationLayer];


% specify training options

options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',100, ...
    'Shuffle','every-epoch', ...
    'Verbose',false, ...
    'Plots', 'none');

% train network

net = trainNetwork(X,Y,layers,options);

