function [ mfccs,f,t ] = ExtractMFCCS( file, winlength )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[Input,Fs] = wavread(file);

[mfccs,spectgram,f,t] = GetSpeechFeatures(Input,Fs,winlength,13);

%mfccs = MFCC_Norm(mfccs);

end

