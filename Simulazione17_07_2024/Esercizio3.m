%Michele Gabrieli
%MAT

clear all; close all; clc; 

A = [1 -1 4; -3 2 0; 0 -5 1]; b = [-3 1 0]'; 

[L, R, P, Q] = gaussPivTot(A, b); 

y = solupper(R, sollower(L, P * b)); 
xSol = Q * y; 

fprintf("\n\nSoluzione: %g %g %g", xSol); 

residuo = b - A * xSol; 
fprintf("\n\nResiduo normalizzato in norma infinito: %g %g %g", ...
    residuo / norm(b, "inf")); 

B = A * A'; d = [1 -2 6]';
[L, flag] = chol(B, "lower"); 
if(flag ~= 0)
    disp("B NON è definita positiva"); 
    [Q, R] = qr(B); 
    xSol2 = solupper(R, Q' * d); 
    fprintf("\n\nSoluzione Bx=d: %g %g %g", xSol2); 
else
    disp("B è definita positiva"); 
    xSol2 = solupper(L', sollower(L, d)); 
    fprintf("\n\nSoluzione Bx=d: %g %g %g", xSol2); 
end

