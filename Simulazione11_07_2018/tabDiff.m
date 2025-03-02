function [d] = tabDiff(x, y)
% TABDIFF - Tabella delle differenze divise sui nodi x e i valori y
%
% INPUT:
%   x (double array) - Vettore dei nodi o punti di osservazione
%   y (double array) - Vettore delle osservazioni
%
% OUTPUT:
%   d (double array) - Coefficienti del polinomio di Newton (ordinati
%                      per grado crescente del termine corrispondente)
%

    % Convertiamo i vettori x e y in colonne
    x = x(:);
    y = y(:);

    % Lunghezza del vettore dei nodi
    n = length(x);

    % Inizializzazione del vettore dei coefficienti
    d = y;

    % Calcolo delle differenze divise
    for k = 2:n
        d(k:n) = (d(k:n) - d(k-1:n-1)) ./ (x(k:n) - x(1:n-k+1));
    end
end % Fine della function tabDiff
