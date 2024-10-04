function [convertedInt] = convDecToBase_int(intToBeConverted, newBase)
%convDecToBase_int -> conversione di un numero n(int) in base data
%   Algoritmo delle divisioni successive
% SYNOPSIS: [convertedInt] = convDecToBase_int(number, base); 
% INPUT: intToBeConverted, n (integer)
% OUTPUT: convertedInt (string)

digits = ['0':'9' 'A':'Z' 'a':'z' '!':'/']; 

if(~isnumeric(intToBeConverted) ...
        || (intToBeConverted ~= fix(intToBeConverted)) || intToBeConverted < 0)
    error("intToBeConverted deve essere un numero intero positivo"); 
end

if(~isnumeric(newBase) || (newBase ~= fix(newBase)) ...
        || newBase < 2 || newBase > numel(digits))
    error("newBase deve essere un numero compreso tra 2 e %d", numel(digits)); 
end

r = 0; 
q = intToBeConverted; 
convertedInt =""; 

while q ~= 0
    r = q - fix(q/newBase) * newBase;
    q = fix(q / newBase); 
    convertedInt = strcat(digits(r+1), convertedInt); 
end

%q = intToBeConverted; 

%while q~=0
%    n = 0; 
%    while (newBase * n) < q
%        n = n + 1; 
%    end
%    r = q - (newBase * (n-1));
%    q = newBase * (n-1)
%    convertedInt()
%end

end


