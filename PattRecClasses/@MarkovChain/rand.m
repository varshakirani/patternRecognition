function S=rand(mc,T)
%S=rand(mc,T) returns a random state sequence from given MarkovChain object.
%
%Input:
%mc=    a single MarkovChain object
%T= scalar defining maximum length of desired state sequence.
%   An infinite-duration MarkovChain always generates sequence of length=T
%   A finite-duration MarkovChain may return shorter sequence,
%   if END state was reached before T samples.
%
%Result:
%S= integer row vector with random state sequence,
%   NOT INCLUDING the END state,
%   even if encountered within T samples
%If mc has INFINITE duration,
%   length(S) == T
%If mc has FINITE duration,
%   length(S) <= T
%
%----------------------------------------------------
%Code Authors:Varsha Kirani, Vamshi Krishna
%----------------------------------------------------

S=zeros(1,T);%space for resulting row vector
nS=mc.nStates;


S(1) = rand(DiscreteD(mc.InitialProb),1);

[len, breadth] = size(mc.TransitionProb);

%finite duration
if len ~= breadth 
    for i=2:T
    i_1Trans = mc.TransitionProb(S(i-1),:);
    S(i)= rand(DiscreteD(i_1Trans),1);
    if S(i) == nS+1 %nS+1 is end state
        S(i)=0;
        break;
    end
    end
end

%infinite duration
if len == breadth
    for i=2:T
        i_1Trans = mc.TransitionProb(S(i-1),:);
        S(i)= rand(DiscreteD(i_1Trans),1);
    end
    
end
%removal of all unassigned values in the case of finite duration as its
%length <= T
S(S==0) = [];

end