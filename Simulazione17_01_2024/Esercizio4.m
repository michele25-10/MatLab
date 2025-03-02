%Michele Gabrieli   
%MAT

close all; clear all; clc; 

M = [5 0 1/3; 0 -2 3/2; 3/4 0 4]; 
z = [-23/7; 34/13; 17/9]; 

D = diag(diag(M)); 
Dinv = eye(3, 3) ./diag(M); 
U = -triu(M, 1); L = -tril(M, -1); 

J = Dinv * (U + L)
eigJ = eig(J); 
rSpectJ = max(abs(eigJ)); 
velJ = -log(rSpectJ); 

DmenoLinv = (D - L) \ eye(3, 3); 

GS = DmenoLinv * U, 
eigGS = eig(GS); 
rSpectGS = max(abs(eigGS)); 
velGS = -log(rSpectGS); 

fprintf("\n\nJACOBI: raggio spettrale: %g, velocità: %g", rSpectJ, velJ); 
fprintf("\n\nGAUSS SEIDEL: raggio spettrale: %g, velocità: %g", rSpectGS, velGS); 

rng("default"); 
maxit = 40; tol = 10^-6; x0 = randn(3, 1); 
[xSol, k] = jacobi(M, z, x0, maxit, tol); 
fprintf("\n\nJACOBI, numero iterazioni: %g", k); 
disp(xSol); 

omega = 1.12; 

DmenoLinv = (D - omega * L) \ eye(3, 3); 
SOR = DmenoLinv * ((1 - omega) * D + omega * U); 
cSOR = DmenoLinv * z; 
xOld = x0; 

for k = 1 : 5
    x = SOR * xOld + cSOR
    xOld = x; 
end

disp(SOR); disp(xOld); 




