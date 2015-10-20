function [ deltas,delta_deltas ] = getDynamicFeatures( mfcc )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%first derivative along columns (each frame)
deltas = diff(mfcc,1,2);

%second derivative along columns (each frame)
delta_deltas = diff(mfcc,2,2); 

end

