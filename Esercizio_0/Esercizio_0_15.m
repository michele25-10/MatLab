function [fattoriale] = ...
    factorial(n)
%factorial calcola il fattorialedi un numero
%SYNOPSIS
%   [fattoriale] = factorial(n)
%
%INPUT
%   n (integer) - number
%
%OUTPUT
%   factorial(integer) - Somma degli elementi sulle colonne
    fattoriale = 1; 
    for i=1:n 
        fattoriale = i * fattoriale; 
    end
end

x = input("\nInserisci un numero così da calcolarne il fattoriale: "); 
[fattoriale] = factorial(x); 
disp(fattoriale); 