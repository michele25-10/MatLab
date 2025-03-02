%Michele Gabrieli   
%Mat

function [y] = Esercizio2(abN, k)
%ESERCIZIO2 Calcola i valori delle y della seguente function
%nell'intervallo da noi inserito e nel numero di punti da noi inserito,
%secondo la costante k.
%   La fx è la seguente:  @(x, k) (((1 + k) .* cos(k * (1-3.*x))) * exp((-x) .* (-x))) ;
%SYNOPSIS:
%   [y] = ruffiniHorner([a; b; n], k)
% 
%  INPUT:
%    abN (array double) - Vettore che contiene intervallo e numero di punti
%    k (double)         - Costante appartenente a intervallo [2, 6]
% 
%  OUTPUT:
%    y (array double) - valori degli n punti nella fx.
 
abN = abN'; 
if(numel(abN) ~= 3), error("il vettore deve contenere a, b, N"), end; 
if(k < 2 || k > 6), error("k deve appartenere all'intervallo [2, 6]"), end; 

a  = abN(1); 
b = abN(2); 
n = abN(3); 

xx = linspace(a, b, n); 

fx = @(x, k) (((1 + k) .* cos(k .* (1-3.*x))) .* exp((-x) .* (-x))) ;

y = fx(xx, k); 



end

