function [D] = tabDiff(x, y)
%TABDIFF Summary of this function goes here
%   Detailed explanation goes here

x = x(:); y = y(:); 
n = numel(x); 

if(n ~= numel(y))
    error("x e y devono essere vettori della stessa dimensione"); 
end

D = y;  

%M = zeros(n); 
%M(:, 1) = y; 

for i = 2:1:n
    %formula con il calcolo matrice triangolare inferiore.
    % M(i:n, i) = (M((i-1):(n-1), i-1) - M(i:n, i-1)) ./ (x(i:n) - x(1:(n - i + 1))); 
    D(i:n) = (D(i:n)-D((i - 1):(n-1)))./(x(i:n)- x(1:(n - i + 1))); 
end
%D = diag(M); 
end

