function [ mfcc ] = MFCC_Norm( mfcc )
[m,n] = size(mfcc);

mfcc_old = mfcc;
%making zero mean
for i=1:m
   
        mfcc(i,:) = (mfcc(i,:) - mean(mfcc_old(i,:)));
end

mfcc_old2 = mfcc;
%making unit variance 
for i=1:m
        
        mfcc(i,:) = mfcc(i,:)/sqrt(var(mfcc_old2(i,:)));
    
end



end

