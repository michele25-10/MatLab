clear all; clc; close all; 

A = [5/3 1/2 0; 1/4 1 1/2; 0 1/3 -3];

D = diag(diag(A)); 
Dinv = diag(1./diag(A)); 
U = -triu(A, 1); L = -tril(A, -1); 

J = Dinv * (U + L)
GS = (D - L) \ U 
