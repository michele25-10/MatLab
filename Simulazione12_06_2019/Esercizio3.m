%Michele Gabrieli
%mat

close all; clear all; clc; 

A = [4 -2 1 0; -6 4 2.5 0; 1 2.5 -6 1; 0 0 1 4]; 
b = [0 2 -6 0]'; 

[L, R, p, deter] = gauss2(A); 

xSol = solupper(R, sollower(L, b(p)))

I4 = eye(4, 4);

[G1, y1] = planerot(A([1, 2], 1)); 
Q1 = I4; Q1([1, 2], [1, 2]) = G1; A1 = Q1 * A;  A1(2, 1) = 0; 

[G2, y2] = planerot(A1([1, 3], 1)); 
Q2 = I4; Q2([1, 3], [1, 3]) = G2; A2 = Q2 * A1; A2(3, 1) = 0;

[G3, y3] = planerot(A2([2, 3], 2)); 
Q3 = I4; Q3([2, 3], [2, 3]) = G3; A3 = Q3 * A2; A3(3, 2) = 0; 

[G4, y4] = planerot(A3([3, 4], 3)); 
Q4 = I4; Q4([3, 4], [3, 4]) = G4; A4 = Q4 * A3; A4(4, 3) = 0; 

Q = (Q4 * Q3 * Q2 * Q1), R = A4

%Da ricontrollare
xSolG = solupper(R, Q' * b); 


r = norm((A * xSolG) - b, "inf") / norm(b, "inf"); 
fprintf("\n\nResiduo normalizzato in norma infinito: %g", r);






