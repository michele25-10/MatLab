%michele Gabrieli
%MAT

close all; clear all; clc; 

M = [3 0 -0.5 -0.5; 0 3 -1 -1; -0.5 -1 3 0; -0.5 -1 0 3]; 
b = [1 3 -1 2]'; 

tmp = diag(M); 
D = eye(4, 4) .* tmp; 
Dinv = eye(4, 4) ./ tmp; 
tmp = []; 

L = -tril(M, -1); 
U = -triu(M, 1); 


J = Dinv * (L + U); 
inv(D-L)
GS = inv(D - L) * U; 
cJ = b .* Dinv;
cGS = b .* inv(D-L); 

rSpectJ = max(abs(eig(J))); 
rSpectGS = max(abs(eig(GS))); 

velJ = -log(rSpectJ); 
velGS = -log(rSpectGS); 

tol = 1.0e-5; maxit=50; omega=1.3; x0 = [1 0 1 0]'; 
[xGS, kGS] = gaussSeidel(M, b, x0, maxit, tol); 
[xSOR, kSOR] = sor(M, b, x0, maxit, tol, omega); 
fprintf("kGS = %g, kSOR = %g", kGS, kSOR); 
