function [x, k] = sor(A, b, x, maxit, tol, omega)
% SOR - Metodo SOR (Gauss-Seidel estrapolato)
%
% Calcola un'approssimazione della soluzione xs del sistema Ax = b
% usando il metodo iterativo SOR con tolleranza d'arresto tol sulla norma
% infinito della differenza di due iterati successivi, partendo dal punto
% iniziale x e con un massimo maxit di iterazioni. 
% Il vettore iniziale viene sovrascritto in uscita con l'approssimazione calcolata della
% soluzione. Il calcolo viene effettuato SENZA calcolo esplicito e memorizzazione
% della matrice di iterazione, ma usando semplicemente gli elementi di A.
%
% SYNOPSIS:
%   [x, k] = sor(A, b, x, maxit, tol, omega)
%
% INPUT:
%   A      (double array)  - Matrice quadrata del sistema lineare
%   b      (double vector) - Vettore dei termini noti del sistema lineare
%   x      (double vector) - Iterato iniziale (sovrascritto da xs in uscita)
%   maxit  (integer)       - Numero massimo di iterazioni consentite
%   tol    (double)        - Tolleranza del criterio di arresto
%   omega  (double)        - Parametro di rilassamento del metodo SOR
%
% OUTPUT:
%   x      (double vector) - Approssimazione della soluzione
%   k      (integer)       - Numero di iterazioni effettivamente compiute
%

n = max(size(A)); % Dimensione della matrice
arresto = 0;      % Variabile di controllo per arresto
k = 0;            % Contatore delle iterazioni

while ~arresto
    xtemp = x;    % Salva il valore corrente di x
    k = k + 1;    % Incrementa il numero di iterazioni
    
    % Ciclo per aggiornare gli elementi di x
    for i = 1:n
        x(i) = (-A(i, [1:(i-1), (i+1):n]) * x([1:(i-1), (i+1):n]) + b(i)) / A(i, i);
        x(i) = (1 - omega) * xtemp(i) + omega * x(i);
    end
    
    % Controllo del criterio di arresto
    arresto = (norm(xtemp - x, inf) < tol * norm(x, inf)) || (k == maxit);
end

% Avviso in caso di mancata convergenza
if k == maxit
    warning('Convergenza non raggiunta');
end

end % fine della funzione sor
