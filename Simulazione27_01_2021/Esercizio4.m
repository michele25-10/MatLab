%Michele Gabrieli
%MAT

close all; clear all; clc; 


n = input("Inserisci un input intero n >= 3 --> n: "); 
while(n<3 && fix(n)~=n)
    n = input("n deve essere >= 3 e un numero intero. --> n: "); 
end

A = spdiags([repmat([-1/2], n, 1) repmat(4, n, 1) repmat([2/3], n, 1)], ...
            [-2 0 2], n, n);

b = -ones(n, 1); b(2:2:end) = 1/4; 

Dinv = speye(n,n) ./ diag(A); 
L = -tril(A, -1); 
U = -triu(A, 1); 

J = Dinv * (L + U); 
cJ = (L + U) * b; 

tol = 1.0E-3; maxit = 100; x = zeros(n, 1); 
i = 1; 
stop = false; 
while(~stop)
    x = J * x + cJ; 

    if(norm(A * x - b, "inf") <= tol ||  i == maxit), stop=true; end
    i = i + 1; 
end

disp(full(x));

rSpect = max(abs(eigs(J))); 
fprintf("Il raggio spettrale è: %g", rSpect); 

