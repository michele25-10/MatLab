function [converted] = convB1toDec(strNum, b1)
%CONVB1TODEC Summary of this function goes here
%   Detailed explanation goes here
    
    if(~isstring(strNum))
        error("Il numero da convertire deve essere in formato stringa")
    end
    
    strNum = num2str(strNum); 
    sign = 1; 
    if(strcmp(strNum(1),'-') == 1)
        sign = -1;
        strNum = strNum(2:end); 
    end
    splitNumber = split(strNum, "."); 

    [intDec] = convB1ToDec_int(splitNumber(1), b1); 
    fracDec = 0; 
    if(numel(splitNumber) == 2)
        [fracDec] = convB1ToDec_frac(splitNumber(2), b1); 
    end 
    disp(intDec); 
    converted = (intDec + fracDec) * sign; 
end

