%Michele Gabrieli
%MAT

clear all; close all; clc; 

A = [1 -1 4; -3 2 0; 0 -5 1]; b = [-3 1 0]'; 
format rat; 
disp(A); 
[L, R, P, Q] = gaussPivTotProva(A, b); 