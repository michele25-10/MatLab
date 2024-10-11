function [fracNumber] = convB1ToDec_frac(numStr, b1)
%CONVB1TODEC_INT Summary of this function goes here
%   Detailed explanation goes here
    digits = ['0':'9' 'A':'Z' 'a':'z' '!':'/'];
    
    if(~isnumeric(b1) || b1 <= 1 || b1 > numel(digits))
        error("B1 deve essere un numero maggiore di uno")
    end

    if(~isstring(numStr))
        error("numStr deve essere una stringa"); 
    end
        
    numStr = num2str(numStr); 
    sizeString = strlength(numStr); 
    for i=1:sizeString
        fracNumber = fracNumber + ((b1^(-i)) * (strfind(digits, numStr(i)) - 1)); 
    end
end

