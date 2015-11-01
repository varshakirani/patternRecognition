close all;
clear all;
clc;

nStatesV = [6,4,5,6,6,5,5,4 ] ;
%classNames = cellstr(['apple';'car';'duck';'eagle';'fire';'goat';'hat';'ice']);
classTest = [1,3,4,5,6,7,8,9];
noClasses = length(classTest);
for i=1:noClasses
    
    eval(['hmm_' num2str(classTest(i)) ' = TrainHMM(' num2str(classTest(i)) ',' num2str(nStatesV(i)) ')' ]);
    
end