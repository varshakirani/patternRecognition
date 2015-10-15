function [valuesDrawn]=rand(pD,nData)
%R=rand(pD,nData) returns random scalars drawn from given Discrete Distribution.
%
%Input:
%pD=    DiscreteD object
%nData= scalar defining number of wanted random data elements
%
%Result:
%R= row vector with integer random data drawn from the DiscreteD object pD
%   (size(R)= [1, nData]
%
%----------------------------------------------------
%Code Authors: Varsha Kirani, Vamshi Krishna
%----------------------------------------------------

if numel(pD)>1
    error('Method works only for a single DiscreteD object');
end;

%%
%probability mass function
PMF = pD.ProbMass;
%values to be drawn
x   = 1:length(PMF);
%Cumulative sum of probability distribution
CMF = cumsum(PMF);
valuesDrawn = zeros(nData,1);
for i = 1:nData
    r = rand(); %generates number between 0 and 1 randomnly
    for j = 1:length(PMF)
        %assign the value to the right section
        if r < CMF(j)
          valuesDrawn(i) = x(j);
          break;%come out of the loop if the right section is found
        end
    end
end
