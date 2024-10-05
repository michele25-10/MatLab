function [converted] = convDecToBase(numToBeConverted, newBase, limit)
%CONVDECTOBASE Summary of this function goes here
%   Detailed explanation goes here
    [nRows, nCols] = size(numToBeConverted); 
    converted = strings(nRows, nCols); 
    for i=1:nRows
        for j=1:nCols
            if (numToBeConverted(i, j) < 0)
                converted(i, j) = strcat("-", converted(i, j)); 
            end

            numToBeConverted(i, j) = abs(numToBeConverted(i, j)); 

            [intPart] = convDecToBase_int(fix(numToBeConverted(i, j)), newBase); 
            [fracPart] = convDecToBase_frac(...
                numToBeConverted(i, j) - fix(numToBeConverted(i, j)), newBase, limit); 
        
            fracPart = num2str(fracPart); 
            converted(i, j) = strcat(converted(i, j), intPart, ...
                fracPart(2:end)); 
 
            if(converted(i, j) == "")
                converted(i, j) = fracPart
            end
        end
    end
end

