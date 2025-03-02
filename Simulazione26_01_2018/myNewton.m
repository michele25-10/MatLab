function [x, it, varargout] = ...
    myNewton(fname, fpname, x0, tolx, tolf, maxit, varargin)
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
% trace (double optional) - diverso da 0
%
% OUTPUT:
% x (double) - Approssimazione della soluzione.
% it (integer) - Numero di iterazioni eseguite.
% xk (optional) - vettore di  tutte le iterazioni calcolate dal metodo fino
%                 all'arresto
% fk (optional) - corrispondenti valori della funzione
    tolfp = min(tolf, 10 * eps); % Tolleranza per il valore della derivata prima

    % Metodo di Newton
    x = x0;
    fx = feval(fname, x);
    it = 0;
    stop = (abs(fx) < tolf); % Criterio di arresto iniziale

    xk(1) = x0; 
    
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
        if(nargin > 1)
            if(varargin{1} ~= 0)
                if(nargout > 0 )
                    xk(it) = x; 
                end
                if(nargout > 1)
                    fk(it) = fx; 
                end
            end
        end

        % Verifica del criterio di arresto
        stop = (abs(fx) < tolf && abs(d) < tolx * abs(x)) ...
               || (fx == 0) || (it == maxit);
    end

    if(nargin > 1)
        if(varargin{1} ~= 0)
            if(nargout > 0)
                varargout{1} = xk; 
            end
            if(nargout > 1)
                varargout{2} = fk; 
            end
        else
        xk = []; fk = []; 
        varargout{1} = xk; 
        varargout{2} = fk; 
        end
    end
    
    

    % Messaggio di avviso se il massimo numero di iterazioni è stato raggiunto
    if (it >= maxit)
        fprintf('\nRaggiunto il massimo numero di iterazioni.\n');
    end
end
