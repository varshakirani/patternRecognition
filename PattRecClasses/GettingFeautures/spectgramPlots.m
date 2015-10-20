close all;
clear all;
clc;

%reading sound file
% y denotes data and Fs denotes sample data
hFile1 = 'female.wav';
[yFemale,Fs1] = wavread(hFile1);

hFile2 = 'music.wav';
[yMusic,Fs2] = wavread(hFile2);

%Music Spectrogram
winlength = 0.03;
[spectgram,f,t] = GetSpeechFeatures(yMusic,Fs2,winlength);
imagesc(t,f,log(spectgram)); %logarithm is used for numerical tractability
xlabel('time in seconds');
ylabel('frequency in Hz');
title('Music Spectrogram');
set(findall(gcf,'type','text'),'FontSize',15,'fontWeight','bold'); %making bold texts

figure;

%Female voice spectogram
winlength2 = 0.03;
[spectgram2,f2,t22] = GetSpeechFeatures(yFemale,Fs1,winlength2);
imagesc(t22,f2,log(spectgram2));%logarithm is used for numerical tractability
xlabel('time in seconds');
ylabel('frequency in Hz');
title('Female Voice Spectrogram');
set(findall(gcf,'type','text'),'FontSize',15,'fontWeight','bold');%making bold texts
