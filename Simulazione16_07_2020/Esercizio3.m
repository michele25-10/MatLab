%Michele Gabrieli
%MAT

close all; 
clear all; 
clc; 

A = [5 0 -1 0; 0 -2 3 0; 0 3 2 -1; 0 0 1 3]; 
b = [3 0 -1 2]'; 

[Q, R] = qr(A); 

xSol = solupper(R, Q' * b); 
disp(xSol); 

rNorm = norm(A * xSol - b, "inf") / norm(b, "inf"); 
fprintf("\nResiduo normalizzato: %g", rNorm);

%Calcolata nell'es di teoria; 
xTeorica = [1 2 3 4]'; 

diffMaxMod = max(abs(xSol -xTeorica)); 

C = R' * R; 

[R, flag] = chol(C, "lower"); 
if(~flag)
    fprintf("\nLa matrice C è definita positiva")
else
    warning("\nLa matrice C NON è definita positiva")
end

[L, R, p, q] = gaussPivTot(A); 
xGauss = solupper(R, sollower(L, b(p))); 

[L, U, P] = lu(A); 
xLu = solupper(U, sollower(L, b(p))); 

fprintf("\n\nxGauss - xlu\n"); 
disp(xGauss - xLu); 

fprintf("\n\nxGauss - xTeorica\n"); 
disp(xGauss - xTeorica); 








