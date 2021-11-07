function [features, featureMetrics] = customFeatureExtractor(I)

%% Step 1: Image Preprocessing
% Convert to grayscale
if size(I,3)==3
    I = rgb2gray(I);
end

%% Step 2: Select points for feature extracts
% MSER used for detection/descriptor

regionsOfInterest = detectMSERFeatures(I);
                    
%% Step 3: Extract features
% SURF for feature extraction
features = extractFeatures(I, regionsOfInterest,'Upright',true);

%% Step 4: Compute the Feature Metric
% Use variance of feature list as a metric threshold
featureMetrics = var(features,[],2);



