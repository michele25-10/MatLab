%Michele Gabrieli
%MAT

clear all; close all; clc; 

n = input("Inserisci grandezza matrice sparsa n: "); 
while(~isscalar(n))
    input("N deve essere scalare. Inserisci grandezza matrice sparsa n: ")
end
n = floor(n); 

diagonale = repmat(3, n, 1); 
sottoDiag = repmat(-2/3, n, 1); 
sopraDiag = repmat(1/2, n, 1); 
A = spdiags([sottoDiag diagonale sopraDiag], [-2, 0, 2], n, n); 
tmp(1:2:n) = -3/5; tmp(2:2:n) = 2; 
b = sparse(tmp'); tmp = []; 

J = diag(1./ diag(A)) * (-tril(A, -1) - triu(A, 1)); 
cJ = J * b; 
xOld = sparse(zeros(n, 1)); 
it = 0; maxit = 40; stop = false; tol = 1.0E-7; 

while(~stop)
    x = J * xOld + cJ
    it = it+1; 
    if(it >= maxit || norm(x - norm(b - A * x ,"inf"), "inf") < tol), stop = true; end
    xOld = x; 
end
disp(xOld); 

fprintf("\n\nNumero di iterazioni: %d", it); 
fprintf("\n\nNorma infinito del residuo normalizzato: %g", ...
    norm(b - A * xOld, "inf") / norm(b, "inf")); 

maxAutoValA = eigs(A, 1, "largestabs"), 
rSpectJ = eigs(J, 1, "largestabs")


