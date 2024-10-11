function [convertedFrac, varargout] = convDecToBase_frac(fracToBeConverted, varargin)
%CONVDECTOBASE_FRAC Conversione della parte frazionaria
%   Algoritmo delle moltiplicazioni successive

digits = ['0':'9' 'A':'Z' 'a':'z' '!':'/']; 

newBase = 16; 
limit = 7; 
verbosity=0; 
if (nargin > 1)
    if(~isempty(varargin{1}))
        newBase = varargin{1}; 
    end
    if(nargin > 2)
        if(~isempty(varargin{2}))
            limit = varargin{2}; 
        end
    end
    if(nargin > 3)
        verbosity=varargin{3}; 
    end
end

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

if(verbosity > 0)
    fprintf("\nconvDecToBase: Initialization..."); 
end
if(nargout > 1)
    MulRes = zeros(limit, 2); 
end
p = fracToBeConverted; 
convertedFrac = "0."; 
i = 1; 

if(verbosity>0)
    fprintf("\nconvDecToBase_frac: entering the while loop..."); 
end
while (i <= limit && p ~= 0)
    p = p * newBase; 
    intero = fix(p); 
    p = p - intero; 
    convertedFrac = strcat(convertedFrac, digits(intero+1)); 
    if(nargout > 1)
        MulRes(i, :) = [p, intero]; 
    end
    if(verbosity>1)
        fprintf("\nconvDecToBase_frac: %s = %d, %s = %d, %s = %d", ...
            "iteration", i, "product", p, "intero", intero); 
    end
    i = i + 1; 
end

if(verbosity > 0)
    fprintf("\nconvDecToBase_frac: finalization and return\n"); 
end
if(nargout > 1)
    varargout{1}=MulRes; 
end

