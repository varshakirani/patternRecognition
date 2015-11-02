function [ class_output ] = TestHMM( filepath )

mfccs = runGetFeatures(filepath);

load('/home/varsha/KTH courses/Pattern Recognition/Project/patternRecognition/PattRecClasses/GettingFeautures/TrainedHMMs/TrainedHMMforAppleToIce2.mat');

for i=1:noClasses
    
eval(['[S,Probs(' num2str(i) ')] = viterbi(hmm_' num2str(classTest(i)) ',mfccs)']);

end

[max_value, max_index] = max(Probs);

class_output = classTest(max_index);

end
