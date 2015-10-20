close all;
clear all;
clc;

%reading all the sound files
%Fs is sample rate and y is data

hFile1 = 'female.wav';
[yFemale,Fs1] = wavread(hFile1);

hFile2 = 'music.wav';
[yMusic,Fs2] = wavread(hFile2);

hFile3 = 'male.wav';
[yMale,Fs3] = wavread(hFile3);

ts1 = 1/Fs1;
ts2 = 1/Fs2;
ts3 = 1/Fs3;
%used in plotting for the time scale
t1 = 0:ts1:(length(yFemale) * ts1 ) - ts1;
t2 = 0:ts2:(length(yMusic) * ts2 ) - ts2;
t3 = 0:ts3:(length(yMusic) * ts3 ) - ts3;

%Plot of Female voice sample
subplot(2,1,1);
plot(t1,yFemale);
xlabel('time in seconds');ylabel('Sampled Data');title('Female voice data');


%Plot of Music sample
subplot(2,1,2);
plot(t2,yMusic);
xlabel('time in seconds');ylabel('Sampled Data');title('Music data');