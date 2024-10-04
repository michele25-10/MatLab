function [converted] = convDecToBase(numToBeConverted, newBase, limit)
%CONVDECTOBASE Summary of this function goes here
%   Detailed explanation goes here

numToBeConverted = abs(numToBeConverted); 

[intPart] = convDecToBase_int(fix(numToBeConverted), newBase); 
[fracPart] = convDecToBase_frac(...
    numToBeConverted-fix(numToBeConverted), newBase, limit); 
 fracPart = num2str(fracPart); 
 
 converted = strcat(intPart, fracPart(2:end)); 
 
 if(converted == "")
    converted = fracPart
 end
 
 if (numToBeConverted < 0)
    converted = strcat("-", converted); 
 end
end

