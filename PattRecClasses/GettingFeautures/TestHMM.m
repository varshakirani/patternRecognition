mfccs = runGetFeatures('/home/varsha/KTH courses/Pattern Recognition/Project/patternRecognition/PattRecClasses/TrainingDataUsed/samples/sample11-08.wav');

for i=1:8
    
eval(['[S,Probs(' num2str(i) ')] = viterbi(hmm_' num2str(classTest(i)) ',mfccs)']);

end

