function [L, U, P, Q] = gaussPivTot(A)
% gaussPivTot - Metodo di Gauss con strategia di pivoting totale
% Fattorizzazione A = P * L * U * Q, dove:
% P è una matrice di permutazione per le righe,
% Q è una matrice di permutazione per le colonne,
% L è triangolare inferiore con elementi diagonali unitari,
% U è triangolare superiore.
%
% INPUT:
%   A (double array) - Matrice quadrata da fattorizzare.
%
% OUTPUT:
%   L (double array) - Matrice triangolare inferiore (con diagonale unitaria).
%   U (double array) - Matrice triangolare superiore.
%   P (double array) - Matrice di permutazione per le righe.
%   Q (double array) - Matrice di permutazione per le colonne.

% Controllo input
[n, m] = size(A);
if n ~= m
    error('La matrice A deve essere quadrata.');
end

% Inizializzazione
P = eye(n);  % Matrice di permutazione per le righe
Q = eye(n);  % Matrice di permutazione per le colonne
L = eye(n);  % Matrice triangolare inferiore

for k = 1:n-1
    % Trova il massimo elemento in valore assoluto nella sottomatrice
    [maxVal, maxIndex] = max(abs(A(k:n, k:n)), [], 'all', 'linear');
    if maxVal < eps
        error('La matrice è singolare o quasi singolare.');
    end

    % Converti l'indice lineare in indici di riga e colonna relativi
    [rowOffset, colOffset] = ind2sub([n-k+1, n-k+1], maxIndex);
    rowIndex = k + rowOffset - 1;
    colIndex = k + colOffset - 1;

    % Scambia righe (pivoting righe)
    A([k, rowIndex], :) = A([rowIndex, k], :);
    P([k, rowIndex], :) = P([rowIndex, k], :);
    if k > 1
        L([k, rowIndex], 1:k-1) = L([rowIndex, k], 1:k-1);
    end

    % Scambia colonne (pivoting colonne)
    A(:, [k, colIndex]) = A(:, [colIndex, k]);
    Q(:, [k, colIndex]) = Q(:, [colIndex, k]);

    % Eliminazione di Gauss
    for i = k+1:n
        L(i, k) = A(i, k) / A(k, k);
        A(i, k:n) = A(i, k:n) - L(i, k) * A(k, k:n);
    end
end

U = triu(A); % Estrarre la matrice triangolare superiore
end
