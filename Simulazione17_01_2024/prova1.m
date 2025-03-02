clear all; 

close all; clear all; clc; 

format rat
A = [-1 4 -1.5; 2 0.5 5; -3 0.75 -2]; b = [-1 0 2]'; 

Ab = [A, b]; 

L = eye(3, 3); 

[val, k] = max(abs(A(:, 1))); 
P1 = [0 0 1; 0 1 0; 1 0 0]; Ab = P1 * Ab;
L(2, 1) = Ab(2, 1) / Ab(1, 1)
L(3, 1) = Ab(3, 1) / Ab(1, 1)
Ab(2, :) = Ab(2, :) - (Ab(2, 1) / Ab(1, 1)) * Ab(1, :),  
Ab(3, :) = Ab(3, :) - (Ab(3, 1) / Ab(1, 1)) * Ab(1, :), 


[val, k] = max(abs(A(2:end, 2))); 
P2 = [1 0 0; 0 0 1; 0 1 0]; Ab2 = P2* Ab; 
Ab2(3, :) = Ab(3, :) - (Ab(3, 2) / Ab(2, 2)) * Ab(2, :), L(3, 2) = Ab(3, 2) / Ab(1, 1); 






