function [x] = solupper(R, b)
% SOLUPPER - Soluzione di sistema triangolare superiore non singolare (per righe)
%
% SYNOPSIS:
% [x] = solupper(R, b)
%
% INPUT:
% R (double array) - Matrice triangolare superiore non singolare
% b (double array) - Vettore dei termini noti
%
% OUTPUT:
% x (double array) - Vettore soluzione del sistema

    [m, n] = size(R);

    % Verifica che R sia una matrice quadrata
    if m ~= n
        error('Matrice di coefficienti non quadrata');
    % Verifica che nessun elemento diagonale sia numericamente troppo vicino a zero
    elseif any(abs(diag(R)) < eps * norm(R, inf))
        error('Almeno un elemento diagonale di R è numericamente troppo vicino a zero');
    else
        % Inizializza la soluzione con il vettore b
        x = b;

        % Risoluzione per l'ultimo elemento
        x(n) = x(n) / R(n, n);

        % Ciclo per risolvere gli elementi precedenti
        for i = n-1:-1:1
            % Calcola il prodotto scalare tra la riga di R e i valori di x già calcolati
            x(i) = x(i) - R(i, i+1:n) * x(i+1:n);

            % Divide per l'elemento diagonale
            x(i) = x(i) / R(i, i);
        end
    end
end
