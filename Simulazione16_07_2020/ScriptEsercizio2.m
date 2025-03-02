%Michele Gabrieli
%MAT

close all; 
clear all; 
clc; 

b = 0.7; p = [-2 1 3 -1]'; q = [5 4 3 2]'; 
x = 1.7 .* 10 .^ (-7:1:2); 

[fx, fx2, y] = Esercizio2(b, p, q, x); 

fprintf("\n\nfx = %d11.4",  fx); 
fprintf("\nfx2 = %d11.4",  fx2); 
fprintf("\ny = %d11.4",  y); 