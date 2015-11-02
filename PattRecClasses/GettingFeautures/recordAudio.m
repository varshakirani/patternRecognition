
recObj = audiorecorder(22050, 16, 1);
recordblocking(recObj, 1);
recData = getaudiodata(recObj);

%%%%Remove initial silence

% for i=1:length(recData)
%     if abs(recData(i)) < 0.01
%         recData(i) = 0;
%     end
%     if abs(recData(i)) > 0.01
%         break;
%     end
% end

recData = recData(recData~=0);
%plot(recData);
audiowrite('recorded_data.wav',recData,22050);


Outptut_Class = TestHMM('/home/varsha/KTH courses/Pattern Recognition/Project/patternRecognition/PattRecClasses/GettingFeautures/recorded_data.wav');