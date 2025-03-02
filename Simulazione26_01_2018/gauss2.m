function [L, R, p, deter] = gauss2(A)
% GAUSS2 - Fattorizzazione di Gauss con pivoting parziale (versione 2)
% Esegue la fattorizzazione PA = LR con l'algoritmo di eliminazione di
% Gauss con pivoting parziale (con aggiornamento mediante diadi)
%
% SYNOPSIS:
% [L, R, p, deter] = gauss2(A)
%
% INPUT:
% A (double array) - Matrice m x n
%
% OUTPUT:
% L (double array) - Matrice triangolare inferiore a diagonale unitaria
% R (double array) - Matrice triangolare/trapezoidale superiore
% p (double array) - Vettore delle permutazioni di righe
% deter (double) - Determinante (della parte quadrata) di A

    [m, n] = size(A);
    deter = 1;
    temp = zeros(1, n);
    p = 1:n;

    % Tolleranza verso lo zero (trascurabilità)
    tol = eps * norm(A, inf);

    % Ciclo per i passi dell'eliminazione di Gauss
    for j = 1:min(m - 1, n)
        % Trova il pivot massimo nella colonna corrente
        [amax, ind] = max(abs(A(j:n, j)));
        ind = ind + j - 1;

        % Scambio delle righe se necessario
        if ind ~= j
            % Scambio degli indici di permutazione
            aux = p(j); 
            p(j) = p(ind); 
            p(ind) = aux;

            % Aggiorna il determinante
            deter = -deter;

            % Scambio delle righe della matrice
            temp = A(ind, :); 
            A(ind, :) = A(j, :); 
            A(j, :) = temp;
        end

        % Aggiorna il determinante
        deter = deter * A(j, j);

        % Procedi solo se il pivot è sufficientemente grande
        if abs(A(j, j)) > tol
            % Divisione della colonna sotto il pivot
            A(j + 1:end, j) = A(j + 1:end, j) / A(j, j);

            % Aggiornamento mediante diadi
            A(j + 1:end, j + 1:end) = A(j + 1:end, j + 1:end) - ...
                                       A(j + 1:end, j) * A(j, j + 1:end);
        end
    end

    % Aggiorna il determinante con l'ultimo elemento diagonale
    deter = deter * A(n, n);

    % Estrai le matrici R (superiore) e L (inferiore con diagonale unitaria)
    R = triu(A);
    L = eye(n) + tril(A(1:n, 1:n), -1);
end
