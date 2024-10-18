%Michele Gabrieli
%Matricola

function [ f ] = esercizio2( x, b, p, q )
%esercizio2 - M-function dell'esercizio 2 della prova scritta del
%             gg/mm/aaaa
%SYNOPSYS
%   [f] = esercizio2(x, b, p, q)
% INPUT
%   x (double array)    - vettore delle ascisse
%   b (double)          - base dell'esponenziale
%   p,q (double array)  - vettori di 4 componenti di parametri della
%                         funzione
%OUTPUT
%   f (double array)    - Valori della funzione f(t) nelle componenti di x

x = x(:); 
n = numel(x); 
for k = 1 : n
    f(k) = -sin(p(1)*b^(q(1)*x(k))) + cos(p(2)*b^(q(2)*x(k))) ...
           -sin(p(3)*b^(q(3)*x(k))) + cos(p(4)*b^(q(4)*x(k))); 
end
y= b.^x; 

f = -sin(p(1)*y.^(q(1))) + cos(p(2)*y.^(q(2))) ...
    -sin(p(3)*y.^(q(3))) + cos(p(4)*y.^(q(4))); 

end

