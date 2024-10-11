function [intNumber] = convB1ToDec_int(numStr, b1)
%CONVB1TODEC_INT Summary of this function goes here
%   Detailed explanation goes here
    digits = ['0':'9' 'A':'Z' 'a':'z' '!':'/'];
    
    if(~isnumeric(b1) || b1 <= 1 || b1 > numel(digits))
        error("B1 deve essere un numero maggiore di uno")
    end
    
    sizeString = strlength(numStr)
    intNumber = 0; 
    for i=1:sizeString
        intNumber = intNumber + ((b1^(sizeString - i)) * (strfind(digits, numStr(i)) - 1)); 
    end
end

