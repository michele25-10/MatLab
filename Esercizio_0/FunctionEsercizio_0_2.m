%anche in MATLAB troviamo overloading e ereditarietà, ma non verranno viste
%in questo corso.

%le function non dovrebbero avere nessuna interazione con l'utente, ne di
%input ne di output

%linea di intestazione chiamata firma
function [sumCols, sumRows, sumRowsSquare, sumALL] = ...
    FunctionEsercizio_02(n)
%FunctionEsercizio_02 Summary of this function goes here
%   Generazione di una matrice casuale da campionamento uniforme in (0,1) e
%   relative elaborazioni
%
%SYNOPSIS
%   [sumCols, sumRows, sumRowsSquare, sumALL] = FunctionEsercizio_02(n)
%
%INPUT
%   n (integer) - Dimensione della matrice
%
%OUTPUT
%   sumCols (double array) - Somma degli elementi sulle colonne
%   sumRows (double array) - Somma degli elementi sulle righe
%   sumRowsSquare ...
%   sumALL ...


    A = rand(n)
    sumCols = sum(A); 
    sumRows = sum(A, 2);  %somma lungo le righe
    sumRowsSquare = sum(A.*A, 2);  
    max(max(A)); 
    sumALL = sum(A(:)); 
end

%esempio chiamata
%[a, b, c, d] = FunctionEsercizio_02

%La chiamata della funzione se non è scritta così, mi restituirà solamente
%la prima riga.
