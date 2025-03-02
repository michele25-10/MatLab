function [x, it] = newton(fname, fpname, x0, tolx, tolf, maxit)
% NEWTON - Metodo di Newton per il calcolo di uno zero di funzione.
% Applica il metodo iterativo di Newton per determinare un’approssimazione
% di uno zero della funzione 'fname', con derivata prima 'fpname',
% partendo dal punto iniziale x0. La funzione non verifica le ipotesi
% di convergenza del metodo.
%
% SYNOPSIS:
% [x, it] = newton(fname, fpname, x0, tolx, tolf, maxit)
%
% INPUT:
% fname (string o function handle) - Funzione della quale calcolare lo zero.
% fpname (string o function handle) - Funzione della derivata prima.
% x0 (double) - Stima iniziale.
% tolx (double) - Distanza minima fra iterati successivi.
% tolf (double) - Soglia verso zero dei valori di f(x).
% maxit (integer) - Numero massimo di iterazioni.
%
% OUTPUT:
% x (double) - Approssimazione della soluzione.
% it (integer) - Numero di iterazioni eseguite.

    tolfp = min(tolf, 10 * eps); % Tolleranza per il valore della derivata prima

    % Metodo di Newton
    x = x0;
    fx = feval(fname, x);
    it = 0;
    stop = (abs(fx) < tolf); % Criterio di arresto iniziale

    while (~stop)
        it = it + 1;
        fpx = feval(fpname, x); % Calcolo della derivata prima

        % Controllo sulla derivata prima
        if (abs(fpx) < tolfp)
            error('|f''(xk)| troppo piccolo.');
        end

        % Calcolo della correzione
        d = fx / fpx;
        x = x - d;
        fx = feval(fname, x); % Calcolo del valore della funzione aggiornata

        % Verifica del criterio di arresto
        stop = (abs(fx) < tolf && abs(d) < tolx * abs(x)) ...
               || (fx == 0) || (it == maxit);
    end

    % Messaggio di avviso se il massimo numero di iterazioni è stato raggiunto
    if (it >= maxit)
        fprintf('\nRaggiunto il massimo numero di iterazioni.\n');
    end
end
