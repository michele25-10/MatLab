%Michele Gabrieli
%MAT

function [xx, y] = Esercizio2(k, a, b, N)
%ESERCIZIO2 Summary of this function goes here
%   Detailed explanation goes here

if(isempty(k) || ~isnumeric(k) || k < 1 || k > 10)
    error("K deve appartenere all'intervallo [1, 10]"); 
end

if(~isnumeric(a)), error("a deve essere uno scalare"); end 
if(~isnumeric(b)), error("b deve essere uno scalare"); end

if(isempty(N) || ~isnumeric(N) || N < 0)
    error("N deve essere un numero naturale"); 
end

xx = linspace (a , b , N + 1)';
y = ( k * (1 - xx ) .^2) .* exp ( - xx .^2 ) ;
end

