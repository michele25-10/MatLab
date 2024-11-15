function [xs, L, R, P] = gaussParz( A, b )
%gaussParz - Metodo di Gauss con strategia di pivoting parziaole per sistemi QUADRATI
% Fattorizzazione PA = LR e soluzione del sistema PAx = Pb mediante algoritmo di
% Gauss con strategia di pivoting parziale
% SYNOPSIS
%    [xs, L, R] = gaussDiag( A, b )
% INPUT
%   A (double array) - Matrice dei coefficienti del sistema
%   b (double array) - termine noto del sistema
% OUTPUT
%  xs (double array) - Soluzione del sistema
%   L (double array) - Fattore triangolare inferiore
%   R (double array) - Fattore triangolare superiore

% Controlli sull'input

% 
[mA, nA] = size(A);
[mb, nb] = size(b);
if ( mb ~= mA), error('Dimensioni del termine noto non compatibili'); end
% implementazione del metodo di eliminazione
p = [1:mA]';
A = [A, b]; soglia = eps*norm(A,'inf');
for k = 1 : (mA - 1)
    [Akmax, indmax] = max( abs( A(k:end, k) ) );
    if ( abs(Akmax) < soglia )
        error('Modulo del pivot del passo k = %d sotto la soglia di %g', ...
              k, soglia);
    end
    if ( indmax ~= k )
        A( [k, indmax], : ) = A( [indmax, k], : );
        p( [k, indmax] )    = p( [indmax, k] );        
    end
    A( (k+1):end, k ) = A( (k+1):end, k ) / A(k,k);
    A( (k+1):end, (k+1):end ) ...
        = A( (k+1):end, (k+1):end ) - A( (k+1):end, k ) * A( k, (k+1):end );
end
xs = utrisol( A,  A(:,end) ); A(:, end) = [];
L = eye(mA) + tril(A, -1);
R = triu(A);
end