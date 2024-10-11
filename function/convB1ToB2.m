function [strConvert] = convB1ToB2(b1, strNum, b2)
%CONVB1TOB2 Summary of this function goes here
%   Detailed explanation goes here
    if(~isnumeric(b1) || b1 <= 1)
        error("B1 deve essere maggiore di uno e numerico"); 
    end
    
    if(~isnumeric(b2) || b2 <= 1)
        error("B1 deve essere maggiore di uno e numerico"); 
    end

    if(b1 == b2)
        strConvert = strcat(b1); 
        return; 
    end

    [decNumber] = convB1toDec(strNum, b1); 
    disp(decNumber); 
    [strConvert] = convDecToBase(decNumber, b2, 7); 
end

