function [L, deter] = cholesky(A)
% CHOLESKY - Fattorizzazione di Cholesky
% 
% INPUT:
% A (double, array) - Matrice simmetrica e definita positiva
%
% OUTPUT:
% L (double, array) - Matrice triangolare inferiore della fattorizzazione di Cholesky
% deter (double)    - Determinante della matrice A

    n = max(size(A)); % Dimensione della matrice
    deter = 1;        % Inizializzazione del determinante

    for j = 1:n
        for i = j:n
            % Calcolo dell'elemento corrente della matrice
            s = A(j, i) - A(i, 1:j-1) * A(j, 1:j-1)';
            
            if i == j
                % Caso diagonale: verifica definita positiva
                if s <= 0
                    error('La matrice non è definita positiva');
                else
                    deter = deter * s;  % Aggiornamento del determinante
                    p(j) = sqrt(s);     % Calcolo della diagonale di L
                end
            else
                % Caso non diagonale: calcolo degli elementi off-diagonali
                A(i, j) = s / p(j);
            end
        end
    end

    % Costruzione della matrice triangolare inferiore L
    L = diag(p) + tril(A, -1);
end
