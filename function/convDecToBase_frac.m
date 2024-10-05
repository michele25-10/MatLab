function [convertedFrac] = convDecToBase_frac(fracToBeConverted, newBase, limit)
%CONVDECTOBASE_FRAC Conversione della parte frazionaria
%   Algoritmo delle moltiplicazioni successive

digits = ['0':'9' 'A':'Z' 'a':'z' '!':'/']; 

if(fracToBeConverted < 0)
    error("fracToBeConverted deve essere un numero frazionario positivo"); 
end

if(fracToBeConverted == fix(fracToBeConverted))
    convertedFrac = "0.0";
    return; 
end

if(~isnumeric(newBase) || (newBase ~= fix(newBase)) ...
        || newBase < 2 || newBase > numel(digits))
    error("newBase deve essere un numero compreso tra 2 e %d", numel(digits)); 
end

if (~isnumeric(limit) ...
        || limit < 0)
    error("fracToBeConverted deve essere un numero intero positivo"); 
end

p = fracToBeConverted; 
convertedFrac = "0."; 

i = 0; 
while (i < limit && p ~= 0)
    p = p * newBase; 
    intero = fix(p); 
    p = p - intero; 
    convertedFrac = strcat(convertedFrac, digits(intero+1)); 
    i = i + 1; 
end

