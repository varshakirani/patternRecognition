
load('/home/varsha/KTH courses/Pattern Recognition/Project/patternRecognition/PattRecClasses/GettingFeautures/TrainedHMMs/TrainedHMMforAppleToIce2.mat');

classification_matrix = zeros(2, noClasses);
for i= 11:12
   
    for j=1:noClasses
        
        filepath = '/home/varsha/KTH courses/Pattern Recognition/Project/patternRecognition/PattRecClasses/TrainingDataUsed/samples/sample';
        
        filepath = strcat(filepath, num2str(i),'-0',num2str(classTest(j)),'.wav');
        
    %    eval(['filepath = filepath' num2str(i) '-0' num2str(classTest(j))]);
        
        eval(['[ class_output ] = TestHMM( filepath )']);
        
     if class_output == classTest(j)
         classification_matrix((i-10),j) = 1; 
     end
     
    
    end
end