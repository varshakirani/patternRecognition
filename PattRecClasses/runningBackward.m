close all;
clear;
clc;
mc = MarkovChain([1 0],[0.9 0.1;0.9 0.1]);  
x = [-0.2,2.6,1.3];
c = [1,0.1625,0.8266,0.0581]
pd(1) = GaussD('Mean',0,'StDev',1);
pd(2) = GaussD('Mean',3,'StDev',2);
pX = prob(pd,x);
%pX(1,:) = pX(1,:)/sum(pX(1,:));
%pX(2,:) = pX(2,:)/sum(pX(2,:));
betaHat=backward(mc,pX,c);