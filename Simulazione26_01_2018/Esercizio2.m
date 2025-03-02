%Michele Gabrieli
%MAT

function [y, tCase1, tCase2] = Esercizio2(alpha, n)
%ESERCIZIO2 Summary of this function goes here
%   Detailed explanation goes here

if(isempty(alpha) || ~isnumeric(alpha)), error("Alpha deve essere numerica"), end; 
if(isempty(n) || ~isnumeric(n)), error("n deve essere numerico"), end; 

%caso 1
tic; 
    y1 = 0; 
    for k = 0 : 1 : n
        tmp = k * alpha; 
        if(rem(k, 2) == 0), y1 = y1 + sin(tmp); else, y1 = y1 + cos(tmp); end 
    end

tCase1 = toc; 

%caso 2
tic; 
    y2 = sum(sin([0: 2: n] .* alpha)) + sum(cos([1:2:n] .* alpha)); 
tCase2 = toc; 

y = y2; 

end

