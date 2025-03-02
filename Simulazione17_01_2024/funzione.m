function [y, idxnoneg] = funzione(x, params)
%FUNZIONE Summary of this function goes here
%   Detailed explanation goes here

y = []; idxnoneg = []; 

if(~isvector(x) || ~isnumeric(x)), error("Vettore x deve essere numerico"); end

if(isempty(params) || ~isnumeric(params) || ~isvector(params) ...
        || numel(params) ~= 4), error("Params è un vettore di 4 numeri"); end

if(~isempty(x))
    idxnoneg = find(x > 0); 

    if(~isempty(idxnoneg))
        tmp = x(idxnoneg(1:end)); 
        x = []; x = tmp; tmp = [];

        y = params(1) * cos(params(2) .* x) .* sin(params(3) .* x + params(4)); 
    end
end

end

