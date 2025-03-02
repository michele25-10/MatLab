
close all; clear all; clc; 

format short; 

A = [1 -1 4; -3 2 0; 0 -5 1]; 
b = [0 -1 2]';

Ab = [A, b]; 
I3 = eye(3,3); 
[G1, y1] = planerot(Ab([1, 2], 1))
Q1 = I3; Q1([1, 2], [1, 2]) = G1; Ab2 = Q1 * Ab; 

[G2, y2] = planerot(Ab2([2, 3], 2))
Q2 = I3; Q2([2, 3], [2, 3]) = G2; Ab3 = Q2 * Ab2; 

Q = Q2 * Q1; 

detA = det(Q) * det(Ab(:, 1:3)), det(A)