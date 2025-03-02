%Michele Gabrieli
%MAT

function [fx, fx2, y] = Esercizio2(b, p, q, x)
%ESERCIZIO2 Summary of this function goes here
%   Detailed explanation goes here

if(isempty(b) || ~isscalar(b) || ~isnumeric(b))
    error("La costante b deve essere un numero scalare"); 
end
if(isempty(p) || ~isvector(p) || numel(p) ~= 4), error("P deve essere un vettore"); end
if(isempty(q) || ~isvector(q) || numel(q) ~= 4), error("Q deve essere un vettore"); end
if(isempty(x) || ~isvector(x)), error("X deve essere un vettore"); end

p = p(:); b = b(:); x = x(:); 

n = numel(x); 
for k=1:n
    fx = -sin(p(1) * (b^(q(1) * x(k)))) + cos(p(2) * (b ^ (q(2) * x(k))))...
         -sin(p(3) * (b^(q(3) * x(k)))) + cos(p(4) * (b ^ (q(4) * x(k)))); 
end

y = b .^ x; 
fx2 = -sin(p(1) .* (b.^(q(1) .* x))) + cos(p(2) .* (b .^ (q(2) .* x)))...
         -sin(p(3) .* (b.^(q(3) .* x))) + cos(p(4) .* (b .^ (q(4) .* x))); 

end

