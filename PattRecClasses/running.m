%% Code to Run for Assigment 1
clc;
clear;
%input the markov chain
%finite duration
T=10000;
mc = MarkovChain([0.75 0.25],[0.7 0.2 0.1;0.6 0.2 0.2]);  
%infinite duration
mc2 = MarkovChain([0.75 0.25],[0.99 0.01;0.03 0.97]);

%Various types of output distributions

%singlevariate Gaussian
pG(1) = GaussD('Mean',0,'StDev',1);
pG(2) = GaussD('Mean',3,'StDev',2);          

%multivariate Gaussian
%pG(1)=GaussD('Mean',[0 0],'Covariance',[1 0;0 1]);    
%pG(2)=GaussD('Mean',[3 3],'Covariance',[2 1;1 4]);

%Generating HMM 
h=HMM(mc2,pG); 

%S is the state and X is the generated output 
%invokes rand of HMM 
[X,S] = rand(h,T); 