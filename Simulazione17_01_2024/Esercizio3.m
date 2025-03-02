%Michele Gabrieli   
%MAT

close all; clear all; clc; 

A = [-1 4 -1.5; 2 0.5 5; -3 0.75 -2]; b = [-1 0 2]'; 

[L, U, p] = lu(A); 

det(A), det(p),det(U)

xSol = solupper(U, sollower(L, p * b))
rNorm = norm(A *xSol - b, "inf")/norm(b, "inf"); 
xTeo = [ 1 2 3]'; 
diffAbs = abs(xTeo -  xSol);

[Q, R, p] = qr(A); 
xSolQR = p * solupper(R, Q' * b)

diffRelSol = (xSolQR - xTeo) ./ xSolQR
diffRelSolTeo = (xSolQR - xTeo) ./ xSolQR




