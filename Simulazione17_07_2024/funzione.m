function [z, tempi] = funzione(x, p)
%FUNZIONE Summary of this function goes here
%   Detailed explanation goes here

x = x(:); p = p(:); 
if(isempty(p) || ~isvector(p) || numel(p) ~= 4)
    error("Errore p deve essere un vettore di 4 elementi"); 
end

f = @(x)(sin((p(1) .* x) + p(2)) .* cos((p(3) .* x) + p(4))); 

tic; 
for k = 1:numel(x)
    z(k, 1) = f(x(k)); 
end
tempi(1) = toc; 

tic; z(:, 2) = f(x); tempi(2) = toc; 



end

