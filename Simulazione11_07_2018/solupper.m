function [x] = solupper(R, b)
% SOLUPPER - Soluzione di sistema triangolare superiore non singolare (per righe)
% SYNOPSIS
%   [x] = solupper(R, b)
% INPUT
%   R (double array) - Matrice triangolare superiore non singolare
%   b (double array) - Vettore dei termini noti
% OUTPUT
%   x (double array) - Vettore soluzione del sistema

    [m, n] = size(R);

    % Verifica che la matrice sia quadrata
    if m ~= n
        error('La matrice dei coefficienti non è quadrata.');
    
    % Verifica che gli elementi diagonali non siano troppo piccoli
    elseif any(abs(diag(R)) < eps * norm(R, inf))
        error('Almeno un elemento diagonale di R è numericamente troppo piccolo.');
    
    else
        % Inizializzazione del vettore soluzione
        x = b;
        
        % Calcolo dell'ultima componente
        x(n) = x(n) / R(n, n);
        
        % Ciclo per risolvere il sistema per sostituzione all'indietro
        for i = n-1:-1:1
            % Calcolo del prodotto scalare (SDOT - BLAS1)
            x(i) = x(i) - R(i, i+1:n) * x(i+1:n);
            x(i) = x(i) / R(i, i);
        end
    end
end % Fine della function solupper
