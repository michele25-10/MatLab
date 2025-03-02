%MIchele Gabrieli
%MAT

clear all; close all; clc; 

n = 4; 

sotDiag = repmat(-1, n, 1);
diagonale = repmat(4, n, 1); 

A = spdiags([sotDiag diagonale sotDiag], [-1; 0;  1], n, n); 
b = repmat(2, n, 1); b([1, n]) = 3; 


L = -tril(A, -1);
U = -triu(A, 1); 
Dinv = speye(n, n) ./ diagonale; 

Jn = Dinv * (U + L); 
cJn = Dinv * b; 

it = 1; 
stop = false; 
xOld = zeros(n, 1); 
for i = 1 : 5
    x = Jn * xOld + cJn
    xOld = x; 
end

[xSol, k] = jacobi(A, b, zeros(n, 1), 5, eps); 

disp(xSol); 
differenzaSoluzioni = norm(xSol - xOld, "inf")/norm(xSol, "inf"); 

rSpect = max(abs(eig(Jn))), vel = -log(rSpect)