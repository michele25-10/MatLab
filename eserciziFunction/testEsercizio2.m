%Michele Gabrieli
%matricola

close all; 
clear;
clc; 

b = 0.7; 
p = [-2, 1 , 3, -1]';
q = [5, 4, 3, 2]'; 
x = 1.7 * 10.^(-7:2);

[ f ] = esercizio2(x, b, p, q); 

fprintf('\n%11.4f\n', f); 
