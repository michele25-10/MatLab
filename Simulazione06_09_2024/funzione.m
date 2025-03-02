function [y] = funzione(K, x)
%FUNZIONE Summary of this function goes here
%   Detailed explanation goes here
K = K(:); 
if(isempty(K) || ~isvector(K) || numel(K) ~= 4)
    error("Il vettore k deve essere => [alpha, beta, gamma, delta]"); 
end
if(isempty(x) || numel(x) == 0 || ~isnumeric(x))
    error("X deve contenere almeno un elemento, e numerico"); 
end

y = cos( K(1) .* x + K(2) ) .* sin( K(3) - exp(K(4) .* x.^2) ); 

end

