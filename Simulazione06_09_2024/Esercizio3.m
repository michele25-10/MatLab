%Michele Gabrieli
%MAT

close all; clear all; clc; 

format short; 

A = [1 -1 4; -3 2 0; 0 -5 1]; 
b = [0 -1 2]';

Ab = [A, b]; 
I3 = eye(3,3); 
[c, s] = givensRot(Ab(1, 1), Ab(2, 1)); G1 = [c, s;  -s, c]; 
Q1 = I3; Q1([1, 2], [1, 2]) = G1; Ab2 = Q1 * Ab; 

[c, s] = givensRot(Ab(2, 2), Ab(3, 2)); G2 = [c, s;  -s, c]; 
Q2 = I3; Q2([2, 3], [2, 3]) = G2; Ab3 = Q2 * Ab2; 

Ab = Ab3; 

Q = Q2 * Q1; Q = Q'; 

detA = det(Q) * det(Ab(:, 1:3)), det(A); 

xSol = solupper(Ab(:, 1:3), Ab(:, 4))
r = norm((A * xSol) - b, "inf") / norm(b, "inf") 

[Qpred, Rpred] = qr(A); 

diffQ = abs(Q - Qpred), diffR = Ab(:, 1:3) - Rpred

B = Rpred' * Qpred * Rpred; 
c = [-1.7 3.1 -0.8]'; 

ind = find([B(1, 1); det(B(1:2, 1:2)); det(B(1:3, 1:3))] < 1)
if(numel(ind) == 0)
    fprintf("\n\nMatrice definita positiva."); 
    R = chol(B, "lower"); 
    xSol = sollower(R, solupper(R', c))
else
    fprintf("\n\nMatrice non è definita positiva."); 
    xSol = B \ c
end




