function [z, index, tMedio] = funzione(x, s, w)
%FUNZIONE Summary of this function goes here
%   Detailed explanation goes here

if(isempty(x) || ~isvector(x)), error("X deve essere un vettore"); end
if(isempty(s) || ~isscalar(s)), error("s deve essere uno scalare"); end
if(isempty(w) || ~isscalar(w) || w == 0), error("w è uno scalare != 0"); end

index = find(((x + s) > 0) & ((x .* ( log ( x + s ) - w )) > 0)); 

xx = x(index(1:end));
disp(xx); 

z = []; tMedio = 0; 
for N=1:10000
    tic
    z = (xx.* (log(s + xx) - w)).^(1/4); 
    tmp = toc; 
    tMedio = tMedio + toc; 
end

tMedio = tMedio / 10000; 

end


