function [x, fx, it] = newton(fname, fpname, x0, tolx, tolf, maxit)
% NEWTON - Metodo di Newton per la soluzione di equazioni non lineari
%
% Determina iterativamente un'approssimazione xs della soluzione
% dell'equazione non lineare f(x) = 0 mediante il metodo di Newton.
%
% SYNOPSIS:
%   [x, fx, it] = newton(fname, fpname, x0, tolx, tolf, maxit)
%
% INPUT:
%   fname  (string o function handle) - Function della funzione f
%   fpname (string o function handle) - Function della derivata prima f' di f
%   x0     (double)                   - Stima iniziale
%   tolx   (double)                   - Distanza minima fra iterati successivi
%   tolf   (double)                   - Soglia verso zero dei valori di f(x)
%   maxit  (integer)                  - Numero massimo di iterazioni
%
% OUTPUT:
%   x      (double)                   - Approssimazione della soluzione dell'equazione
%   fx     (double)                   - Valore della funzione in x
%   it     (integer)                  - Numero di iterazioni compiute fino all'arresto
%
tolfp = min(tolf, 10 * eps); % Soglia per la derivata troppo piccola

% Metodo di Newton
x = x0; % Inizializzazione della stima
fx = feval(fname, x); % Calcolo della funzione f(x) in x0
it = 0; % Contatore delle iterazioni
stop = (abs(fx) < tolf); % Condizione iniziale di arresto

while ~stop
    it = it + 1;
    fpx = feval(fpname, x); % Calcolo della derivata f'(x)
    
    if abs(fpx) < tolfp
        error('|f''(xk)| troppo piccolo.'); % Errore se la derivata è troppo piccola
    end
    
    d = fx / fpx; % Calcolo dello spostamento
    x = x - d;    % Aggiornamento della stima
    fx = feval(fname, x); % Calcolo del nuovo valore di f(x)
    
    % Controllo delle condizioni di arresto
    stop = (abs(fx) < tolf && abs(d) < tolx * abs(x)) || (fx == 0) || (it == maxit);
end

% Messaggio se il massimo numero di iterazioni è stato raggiunto
if it >= maxit
    fprintf('\nRaggiunto il massimo numero di iterazioni.\n');
end

end % fine della funzione newton
