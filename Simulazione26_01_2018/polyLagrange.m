function [p, coeff] = polyLagrange(x, y, punti)
% POLYLAGRANGE - Calcola il polinomio interpolante nella forma di Lagrange.
%
% INPUT:
% x (double array)    - Vettore dei nodi o punti di osservazione.
% y (double array)    - Vettore delle osservazioni.
% punti (double array) - Vettore dei punti in cui calcolare il polinomio di Lagrange.
%
% OUTPUT:
% p (double array)    - Valore del polinomio nei punti specificati.
% coeff (double array) - Coefficienti della base di Lagrange.

    n1 = length(y); % Numero di osservazioni
    coeff = zeros(size(x)); % Inizializzazione dei coefficienti
    p = zeros(size(punti)); % Inizializzazione dei valori del polinomio

    % Calcolo dei coefficienti della base di Lagrange
    for k = 1:n1
        coeff(k) = y(k) / prod(x(k) - x([1:k-1, k+1:n1]));
    end

    % Calcolo del polinomio nei punti specificati
    for j = 1:length(punti)
        ij = find(punti(j) == x); % Verifica se il punto è un nodo

        if isempty(ij)
            % Calcolo del polinomio di Lagrange
            p(j) = prod(punti(j) - x) * ...
                   sum(coeff ./ (punti(j) - x));
        else
            % Se il punto è un nodo, restituisci il valore corrispondente
            p(j) = y(ij(1));
        end
    end
end
