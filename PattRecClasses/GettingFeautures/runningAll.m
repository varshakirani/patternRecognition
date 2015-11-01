%this script reads all audio data and gives mfcc of the folder
close all;
clear all;
clc;

% listing = dir(fullfile('/home/varsha/KTH courses/Pattern Recognition/Project/patternRecognition/PattRecClasses/TrainingDataUsed/samples/*.wav'));


listing = dir(fullfile('/home/varsha/KTH courses/Pattern Recognition/Project/patternRecognition/PattRecClasses/TrainingDataUsed/samples/*01.wav'));
[rows,cols] = size(listing);

%%

% for i=1:rows
%     %mfccs(:,:,i) = runGetFeatures(listing(i).name)
%     
%      var_s = listing(i).name;
%      t = strfind(var_s,'-');
%      e = strfind(var_s,'e');
%      no1 = var_s(e+1:t-1);
%      no2 = var_s(t+1:t+2);
%     
%      eval([ 'mfccs_' no1 '_' no2 '= runGetFeatures(listing(i).name)']);
%     
%       
% end
%%
row_i = 0;
mfccs = runGetFeatures(listing(1).name);
xT = mfccs;
lData = size(mfccs,2);
for i =2:rows
%     eval([ 'mfccs_' num2str(i) '= runGetFeatures(listing(i).name)']);
    mfccs = runGetFeatures(listing(i).name);
    xT = [xT mfccs];
lData = [lData size(mfccs,2)];
    %     len_t = size(mfccs,2);
%     if len_t > row_i
%         row_i = len_t;
%     end
end
% xT = zeros(row_i,13*12);

% for i=1:rows
%      mfccs = runGetFeatures(listing(i).name);
%     xT(1:size(mfccs,2),(1+(i-1)*13):(13*i)) = mfccs';
% end
%number of phonemes in english is 44. So we are considering 44 states
% lxT = ones(1,13) * 13;
nStates = 40;
q = zeros(nStates,1);
q(1,1) = 1;
mc = MarkovChain(q,eye(nStates));
for i=1:nStates
pG(i) = GaussD('Mean',zeros(1,13),'Covariance',ones(13));
end

h=HMM(mc,pG);
nIterations = 2;
minStep =log(1.01) ;
hmm = MakeLeftRightHMM(nStates,pG,xT,lData);


% [hmm,logprobs]=train(h,xT,lxT,nIterations,minStep);
% train(h,)