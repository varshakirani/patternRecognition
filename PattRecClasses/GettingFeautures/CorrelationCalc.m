close all;
clear all;
clc;
%frame length
winlength = 0.03;

%reading male voice sound clip
hFile3 = 'male.wav';
[yMale,Fs3] = wavread(hFile3);

%feature extraction
[mfccs_m,spectgram_m,f_m,t_m]=GetSpeechFeatures(yMale,Fs3,winlength,13);
mfccs_m = MFCC_Norm(mfccs_m);
figure;

%logarithm used for numerical tractability
corr_spect = corr(log(spectgram_m));
corr_cept = corr(mfccs_m);

%gray scale to make easier analysis
colormap gray;
%absolute to remove negatives
imagesc(abs(corr_spect));
title('Correlation matrix for Spectral coefficients time series');
colormap gray;
%making bold texts
set(findall(gcf,'type','text'),'FontSize',15,'fontWeight','bold'); 
figure;

imagesc(abs(corr_cept));
title('Correlation matrix for Cepstral coefficients time series');
colormap gray;
%making bold texts
set(findall(gcf,'type','text'),'FontSize',15,'fontWeight','bold'); 