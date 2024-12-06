function [alpha, res, r] = regressLineare(A, y)
% regressLineare - Problema lineare di regressione polinomiale
%
% INPUT
% A (double, array) - Matrice di regressione lineare
% y (double, array) - Vettore delle osservazioni
%
% OUTPUT
% alpha (double, array) - Vettore soluzione
% res (double) - Norma 2 del vettore residuo
% r (double, array) - Vettore residuo

    [m, n] = size(A);        % Dimensioni della matrice A
    [Q, R] = qr(A);          % Fattorizzazione QR della matrice A
    ytilde = Q' * y;         % Trasformazione del vettore y usando Q

    % Calcolo del vettore soluzione alpha
    alpha = R(1:n, 1:n) \ ytilde(1:n);

    % Calcolo del vettore residuo
    r = Q * [zeros(n, 1); ytilde(n+1:m)];

    % Norma 2 del vettore residuo
    res = norm(r, 2)^2; % Alternativa: norm(ytilde(n+1:m), 2)^2
end
