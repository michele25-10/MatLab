function [x] = sollower(L, b)
% SOLLOWER - Soluzione di sistema triangolare inferiore non singolare (per righe)
% 
% SYNOPSIS:
% [x] = sollower(L, b)
%
% INPUT:
% L (double array) - Matrice triangolare inferiore non singolare
% b (double array) - Vettore dei termini noti
%
% OUTPUT:
% x (double array) - Vettore soluzione del sistema

    [m, n] = size(L);

    % Verifica che L sia una matrice quadrata
    if m ~= n
        error('Matrice di coefficienti non quadrata');
    % Verifica che nessun elemento diagonale sia troppo vicino a zero
    elseif any(diag(L) < eps * norm(L, inf))
        error('Almeno un elemento diagonale di L è numericamente troppo vicino a zero');
    else
        % Inizializza la soluzione con il vettore b
        x = b;

        % Risoluzione del primo elemento
        x(1) = x(1) / L(1, 1);

        % Ciclo per risolvere gli elementi successivi
        for i = 2:n
            % Calcola il prodotto scalare tra la riga di L e i valori di x già calcolati
            x(i) = x(i) - L(i, 1:i-1) * x(1:i-1);

            % Divide per l'elemento diagonale
            x(i) = x(i) / L(i, i);
        end
    end
end
