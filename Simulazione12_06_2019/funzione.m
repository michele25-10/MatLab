function [y] = funzione(alpha,beta, x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if(isempty(alpha) || ~isscalar(alpha) || ~isnumeric(alpha))
    error("Il parametro alpha deve appartenere ad R"); 
end

if(isempty(beta) || ~isscalar(beta) || ~isnumeric(beta))
    error("Il parametro beta deve appartenere ad R"); 
end

y = cos(x) ./ (alpha - exp(beta .* x)); 

end

