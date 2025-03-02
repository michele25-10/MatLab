function [x, k] = gaussSeidel(A, b, x, maxit, tol)
% GAUSSSEIDEL - Metodo iterativo di Gauss-Seidel per sistemi lineari
%
% SYNOPSIS:
%   [x, k] = gaussSeidel(A, b, x, maxit, tol)
%
% INPUT:
%   A      (double array) - Matrice dei coefficienti (n x n)
%   b      (double array) - Vettore dei termini noti (n x 1)
%   x      (double array) - Vettore iniziale di partenza (n x 1)
%   maxit  (integer)      - Numero massimo di iterazioni consentite
%   tol    (double)       - Tolleranza richiesta per la convergenza
%
% OUTPUT:
%   x      (double array) - Vettore soluzione del sistema lineare
%   k      (integer)      - Numero di iterazioni eseguite
%

n = size(A, 1); % Dimensione della matrice A

for k = 1:maxit
    xtemp = x; % Salva il valore corrente di x
    
    % Aggiornamento degli elementi di x
    for i = 1:n
        x(i) = (-A(i, [1:(i-1), (i+1):n]) * x([1:(i-1), (i+1):n]) + b(i)) / A(i, i);
    end
    
    % Verifica della convergenza
    if norm(xtemp - x, inf) < tol * norm(x, inf)
        break;
    end
end

% Avviso in caso di mancata convergenza
if k == maxit
    warning('Convergenza non raggiunta');
end

end % fine della funzione gaussSeidel
