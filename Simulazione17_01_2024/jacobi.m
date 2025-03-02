function [x, k] = jacobi(A, b, x, maxit, tol)
%JACOBI - Metodo iterativo di Jacobi per sistemi lineari
% INPUT:
% A      - Matrice dei coefficienti (quadrata)
% b      - Vettore dei termini noti
% x      - Vettore iniziale di approssimazione
% maxit  - Numero massimo di iterazioni consentite
% tol    - Tolleranza per il criterio di arresto
% OUTPUT:
% x      - Approssimazione della soluzione
% k      - Numero di iterazioni effettuate

n = size(A, 1); % Numero di righe (matrice quadrata)

% Estrazione della diagonale
if issparse(A)
    d = spdiags(A, 0);
else
    d = diag(A);
end

% Controllo elementi diagonali
if any(abs(d) < eps * norm(d, inf))
    error('Elementi diagonali troppo piccoli.');
end

% Pre-elaborazione di b
b = b ./ d;

% Inizializzazione
k = 0;
stop = false;

% Iterazione
while ~stop
    k = k + 1;
    xtemp = x; % Memorizza l'approssimazione precedente

    % Aggiornamento vettoriale dell'approssimazione
    x = x - (A * x) ./ d + b;

    % Controllo del criterio di arresto
    stop = (norm(xtemp - x, inf) < tol * norm(x, inf)) || (k == maxit);
end

% Avviso se si raggiunge il numero massimo di iterazioni
if k == maxit
    warning('Raggiunto il numero massimo di iterazioni maxit = %d', maxit);
end

end