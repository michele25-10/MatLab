function [convertedInt, varargout] = convDecToBase_int(intToBeConverted, varargin)
%convDecToBase_int -> conversione di un numero n(int) in base data
%   Algoritmo delle divisioni successive
% SYNOPSIS: [convertedInt [, QuotRes]] = convDecToBase_int(number [, newBase]); 
% INPUT: intToBeConverted (integer),
%        newBase (integer, optional) - base di conversione
% OUTPUT: convertedInt (string) - mandatory
%         QuotRes (double array, optional) - Risultati intermedi
%         dell'algoritmo delle divisioni successive.

digits = ['0':'9' 'A':'Z' 'a':'z' '!':'/']; 
newBase = 16; %default value
if(nargin > 1)
    newBase = varargin{1}
end

if(~isnumeric(intToBeConverted) ...
        || (intToBeConverted ~= fix(intToBeConverted)) || intToBeConverted < 0)
    error("intToBeConverted deve essere un numero intero positivo"); 
end

if(~isnumeric(newBase) || (newBase ~= fix(newBase)) ...
        || newBase < 2 || newBase > numel(digits))
    error("newBase deve essere un numero compreso tra 2 e %d", numel(digits)); 
end

q = intToBeConverted; 
convertedInt =""; 

if (nargout > 1)
    maxdigits = 100; 
    QuotRes = zeros(maxdigits, 2);  
end
k=1; 
while q ~= 0
    r = q - fix(q/newBase) * newBase;
    q = fix(q / newBase); 
    if(nargout > 1)
        QuotRes(k, :) = [q, r]; 
    end
    convertedInt = strcat(digits(r+1), convertedInt); 
    k = k + 1; 
end
if (nargout > 1)
    if (k < maxdigits)
        QuotRes = QuotRes(1:k, :); %oppure QuotRes((k+1):maxdigits, :)=[]
    end 
    varargout{1} = QuotRes; 
end
end


