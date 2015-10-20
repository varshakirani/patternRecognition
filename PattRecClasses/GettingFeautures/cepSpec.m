close all;
clear all;
clc;
hFile1 = 'female.wav';
[yFemale,Fs1] = wavread(hFile1);

hFile3 = 'male.wav';
[yMale,Fs3] = wavread(hFile3);
winlength = 0.03;
[mfccs_m,spectgram_m,f_m,t_m]=GetSpeechFeatures(yMale,Fs3,winlength,13);
[mfccs_f,spectgram_f,f_f,t_f]=GetSpeechFeatures(yFemale,Fs1,winlength,13);

mfccs_m = MFCC_Norm(mfccs_m);

mfccs_f = MFCC_Norm(mfccs_f);

subplot(2,1,1);imagesc(t_m,f_m,log(spectgram_m));
xlabel('time in seconds');
ylabel('Spectral Coefficients');
title('Male Voice Spectrogram');
subplot(2,1,2);imagesc(t_f,f_f,log(spectgram_f));
xlabel('time in seconds');
ylabel('Cepstral Coefficients');
title('Female Voice Spectrogram for the same phrase');
set(findall(gcf,'type','text'),'FontSize',12,'fontWeight','bold'); %making bold texts
figure;
subplot(2,1,1);plot(t_m,mfccs_m(1:5,:));
xlabel('time in seconds');
ylabel('Cepstral Coefficients');
title('Male Voice Cepstrogram');
subplot(2,1,2);plot(t_f,mfccs_f(1:5,:));
xlabel('time in seconds');
ylabel('Cepstral Coefficients');
title('Female Voice Cepstrogram for the same phrase');
set(findall(gcf,'type','text'),'FontSize',12,'fontWeight','bold'); %making bold texts