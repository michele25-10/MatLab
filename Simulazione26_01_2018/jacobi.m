function [x, k] = jacobi(A, b, x, maxit, tol)
% JACOBI - Metodo iterativo di Jacobi per sistemi lineari.
% Calcola un'approssimazione della soluzione del sistema lineare Ax = b
% mediante il metodo iterativo di Jacobi. Per sistemi sparsi e non.
%
% SYNOPSIS:
% [x, k] = jacobi(A, b, x, maxit, tol)
%
% INPUT:
% A (double array) - Matrice dei coefficienti del sistema, quadrata, a diagonale non nulla.
% b (double array) - Vettore dei termini noti.
% x (double array) - In ingresso: vettore iterato iniziale.
% maxit (integer, positive) - Numero massimo di iterazioni consentite.
% tol (double, positive) - Tolleranza verso zero (soglia di trascurabilità).
%
% OUTPUT:
% x (double array) - In uscita: vettore di approssimazione della soluzione del sistema lineare.
% k (integer) - Numero di iterazioni effettuate.
    
    [m, n] = size(A);
    
    % Verifica che la matrice A sia quadrata
    if m ~= n
        error('La matrice dei coefficienti deve essere quadrata');
    end
    
    % Estrai la diagonale della matrice A
    if issparse(A)
        d = spdiags(A, 0);
    else
        d = diag(A);
    end
    
    % Verifica che nessun elemento diagonale sia troppo piccolo
    if any(abs(d) < eps * norm(d, inf))
        error('Almeno un elemento diagonale numericamente troppo piccolo');
    end
    
    % Precondizionamento di b
    b = b ./ d;
    
    % Inizializzazione delle variabili di controllo
    k = 0; 
    stop = false;
    
    % Iterazione del metodo di Jacobi
    while ~stop
        k = k + 1;
        xtemp = x;
        x = x - (A * x) ./ d + b;
        
        % Controllo della condizione di arresto
        stop = (norm(xtemp - x, inf) < tol * norm(x, inf)) || (k == maxit);
    end
    
    % Verifica di mancata convergenza
    if k == maxit
        error('Convergenza non raggiunta');
    end
end % Fine della funzione jacobi
