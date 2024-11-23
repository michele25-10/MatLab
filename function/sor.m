function [x, k] = sor(A, b, x, maxit, tol, omega)
%SOR - Metodo SOR (Gauss-Seidel estrapolato)

n = max(size(A));
k = 0; stop = 0;

while ( ~stop )
    k = k + 1; xtemp = x;
    for i = 1 : n
        x(i) = ( b(i) - A(i, [1:(i-1), (i+1):n]) * x([1:(i-1), (i+1):n]) ) / A(i,i);
        x(i) = (1 - omega) * xtemp(i) + omega * x(i);
    end

    stop = ( norm(xtemp - x, inf) < tol*norm(x, inf) ) || ( k == maxit );
end

if ( k == maxit )
    warning('Raggiunto il numero massimo di iterazioni maxit = %d', maxit);
end

end % fine della function sor.m