function [xs, L, R, P] = gaussParz(A, b)
%GAUSSPARZ Fattorizzazione LR e soluzione del sistema PAx=Pb per sistemi
%   Quadrati
%   metodo di Gauss con strategia di pivoting parziale
%SYNOPSIS
%   [xs, L, R] = gauss1(A, b)
%INPUT
%   A (double array) - Matrice dei coefficienti del sistema
%   b (double array) - termine noto del sistema
%OUTPUT
%   xs (double array) - Soluzione del sistema
%   L (double array) - Fattore triangolare inferiore
%   R (double array) - Fattore triangolare superiore

%controlli sull'input

[mA, nA] = size(A); 
[mb, nb] = size(b); 
if(mb ~= mA)
    error("Dimensioni del termine noto non compatibili"); 
end

%Implementazione del metodo di eliminazione
A = [A, b]; 
soglia = eps*norm(A, 'inf'); 

P = [1:mA]'; 
for k=1:(mA-1)
    %m
    A((k+1):end, k) = A((k+1):end, k)/A(k,k); 
    [akmax, indmax] = max(abs(A(k:end, k))); 

    if(abs(akmax) < soglia)
        error('Modulo del pivot del passo k = %d sotto la soglia di %g'...
            , k, soglia); 
    end 
    
    %scambio delle righe
    if(indmax ~= k )
        A([k, indmax], :) = A([indmax, k], :); 
        P([k, indmax]) = A([indmax, k]); 
    end
        
    A((k+1):end, (k+1):end) = ...
        A((k+1):end, (k+1):end) - A((k+1):end, k) * A(k, (k+1):end); 
end

xs=utrisol2(A, A(:, end)); 
A(:, end) = []; 
L= eye(nA) + tril(A, -1);
R=triu(A);

end


%Sistema L ed R