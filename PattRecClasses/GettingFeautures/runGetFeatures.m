function [ mfccs_m ] = runGetFeatures( hFile1 )

%play audi
% gong = audioplayer(ySample(:,1), Fs1);
% play(gong);

% hFile1 = 'apple_vamshi_male.wav';
%hFile1 = 'sample9-07.wav';
%hFile1 = 'sample1-01.wav';
[ySample,Fs1] = wavread(hFile1);


%%Resampling to 22050 as per instruction
ySample = resample(ySample,22050,Fs1);


winlength = 0.03;


%taking the first channel of the audio
[mfccs_m,spectgram_m,f_m,t_m]=GetSpeechFeatures(ySample(:,1),22050,winlength,13);

%Removing NaN columns in mfcc
[row, col] = find(isnan(mfccs_m));
    mfccs_m(:,col) = [];

mfccs_m = MFCC_Norm(mfccs_m);
end
