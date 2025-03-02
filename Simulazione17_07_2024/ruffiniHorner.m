function [r, q] = ruffiniHorner(p, a)
% RUFFINIHORNER - Schema di Ruffini-Horner
% Calcola il valore di un polinomio p(x) nel punto x = a e i coefficienti
% del polinomio quoziente q(x) = p(x) / (x - a).
%
% SYNOPSIS:
%   [r, q] = ruffiniHorner(p, a)
%
% INPUT:
%   p (double array) - Vettore dei coefficienti del polinomio, ordinati
%                      dal grado più alto al grado zero.
%   a (double)       - Punto (numero reale) in cui calcolare il polinomio.
%
% OUTPUT:
%   r (double)       - Valore del polinomio nel punto x = a.
%   q (double array) - Vettore dei coefficienti del polinomio quoziente
%                      q(x) = p(x) / (x - a).

    % Inizializzazione della variabile r
    r = [];

    % Controllo se il vettore dei coefficienti è vuoto
    if isempty(p)
        q = [];
        warning('Il vettore p dei coefficienti è vuoto.');
        return;
    % Controllo se il punto a è vuoto
    elseif isempty(a)
        q = p;
        warning('Il punto "a" in cui valutare il polinomio è vuoto.');
        return;
    else
        % Calcolo del grado del polinomio
        n = numel(p) - 1; % grado del polinomio
        
        % Preallocazione del vettore per il polinomio quoziente
        q = zeros(n + 1, 1);
        q(1) = p(1); % Il primo coefficiente rimane invariato
        
        % Algoritmo di Ruffini-Horner
        for i = 2:n + 1
            q(i) = q(i - 1) * a + p(i);
        end
        
        % Estrazione del resto (r) e del polinomio quoziente (q)
        r = q(n + 1); % Resto
        q = q(1:n);   % Coefficienti del quoziente
    end
end % Fine della funzione ruffiniHorner
