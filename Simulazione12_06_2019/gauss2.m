function [L, R, p, deter] = gauss2(A)
% GAUSS2 - Fattorizzazione di Gauss con pivoting parziale (versione 2)
% Esegue la fattorizzazione PA = LR con l’algoritmo di eliminazione di
% Gauss con pivoting parziale (con aggiornamento mediante diadi)

% SYNOPSIS
% [L, R, p, deter] = gauss2(A)
% INPUT
% A (double array) - Matrice m x n
% OUTPUT
% L (double array) - Matrice triangolare inferiore a diagonale unitaria
% R (double array) - Matrice triangolare / trapezoidale superiore
% p (double array) - Vettore delle permutazioni di righe
% deter (double) - Determinante (della parte quadrata) di A

[m, n] = size(A);
deter = 1;
temp = zeros(1, n);
p = 1:n;
tol = eps * norm(A, inf); % Tolleranza verso lo zero (trascurabilità)

for j = 1:min(m-1, n)
    % Trova il massimo pivot nella colonna corrente
    [amax, ind] = max(abs(A(j:n, j)));
    ind = ind + j - 1;
    
    % Scambia le righe se necessario
    if ind ~= j
        % Scambio di indici
        aux = p(j);
        p(j) = p(ind);
        p(ind) = aux;
        deter = -deter;
        
        % Scambio di righe
        temp = A(ind, :);
        A(ind, :) = A(j, :);
        A(j, :) = temp;
    end
    
    % Aggiorna il determinante
    deter = deter * A(j, j);
    
    % Procedi solo se il pivot è maggiore della tolleranza
    if abs(A(j, j)) > tol
        % Calcola i moltiplicatori per l'eliminazione
        A(j+1:end, j) = A(j+1:end, j) / A(j, j);
        
        % Aggiornamento della parte restante della matrice
        A(j+1:end, j+1:end) = A(j+1:end, j+1:end) - A(j+1:end, j) * A(j, j+1:end);
    end
end

% Aggiorna il determinante con l'ultimo pivot
deter = deter * A(n, n);

% Estrai R e L dalla matrice risultante
R = triu(A);
L = eye(n) + tril(A(1:n, 1:n), -1);

end % Fine della funzione gauss2
