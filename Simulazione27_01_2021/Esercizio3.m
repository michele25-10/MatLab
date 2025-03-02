%Michele Gabrieli
%MAT

close all; clear all; clc; 

A = [1 -1 2 0; -3 2 0 4; 0 -5 1 -2; 0 0 2 1]; 
b = [0 -2 1 0]'; 

[L, R, p, deter] = gauss2(A);

xSol = solupper(R, sollower(L, b(p))); 
rNorm = norm(A * xSol - b, "inf") / norm(b, "inf"); 

fprintf("Soluzione: \n"); disp(xSol); 
fprintf("\n\nResiduo normalizzato: %g", rNorm); 

%Seconda parte
B = A' * A; 
[R, flag] = chol(B, "lower"); 
if(flag ~= 0)
    disp("B non è definita positiva")
else 
    disp("B è definita positiva"); 
    c = [7/3 1 2 -5/6]'; 
    xSol = solupper(R', sollower(R, c)); 
    fprintf("\n\nSoluzione sistema Bx = c --> \n"); disp(xSol); 
end




