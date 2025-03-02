function [L, R, P, Q] = gaussPivTot(A, b)
% gaussPivTot: Risoluzione di un sistema lineare con eliminazione di Gauss
% con pivoting totale. Restituisce le matrici L, R, P, e Q.
%
% Input:
%   A - Matrice dei coefficienti (n x n)
%   b - Vettore dei termini noti (n x 1)
%
% Output:
%   L - Matrice triangolare inferiore (n x n)
%   R - Matrice triangolare superiore (n x n)
%   P - Matrice di permutazione delle righe (n x n)
%   Q - Matrice di permutazione delle colonne (n x n)

[n, m] = size(A);
if n ~= m
    error('La matrice A deve essere quadrata.');
end
if length(b) ~= n
    error('Il vettore b deve avere la stessa dimensione di A.');
end

% Inizializzazione delle matrici
P = eye(n); % Matrice di permutazione delle righe
Q = eye(n); % Matrice di permutazione delle colonne
L = eye(n); % Matrice triangolare inferiore
R = A;      % Copia iniziale della matrice A

for k = 1:n-1
    % Pivoting totale: ricerca del massimo elemento in valore assoluto
    [max_val, idx] = max(abs(R(k:n, k:n)), [], 'all', 'linear');
    [row, col] = ind2sub([n-k+1, n-k+1], idx);
    row = row + k - 1; % Ricalcolo degli indici relativi a tutta la matrice
    col = col + k - 1;

    % Scambio delle righe
    if row ~= k
        R([k, row], :) = R([row, k], :)
        P([k, row], :) = P([row, k], :)
        L([k, row], 1:k-1) = L([row, k], 1:k-1)
   end

    % Scambio delle colonne
    if col ~= k
        R(:, [k, col]) = R(:, [col, k])
        Q(:, [k, col]) = Q(:, [col, k])
    end

    % Eliminazione gaussiana
    for i = k+1:n
        L(i, k) = R(i, k) / R(k, k)
        disp(R(i, :) - L(i, k) * R(k, :)); 
        R(i, :) = R(i, :) - L(i, k) * R(k, :)
    end
end

% Verifica compatibilità
if rank(A) < n
    error('La matrice A è singolare o mal condizionata.');
end

% Restituzione delle matrici
end
