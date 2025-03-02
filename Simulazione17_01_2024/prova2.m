%Michele Gabrieli   
%MAT

close all; clear all; clc; 

N = 3; a = 0; b = 3; 
x = linspace(a, b, N)'; 
f = @(x)(cos(x) .* sin(sqrt(x) + 3)); 
y = f(x); 

p = polyfit(x, y, 2)

abs(f(1.8) - polyval(p, 1.8))/f(1.8)


%nodi chebychev

tj = cos(((2 * (0:2) + 1)./(2*3)).*pi)'
x = (b-a)/2 .* tj + ((b+a)/2)
y = f(x)

p = polyfit(x, y, 2)

abs(f(1.8) - polyval(p, 1.8))/f(1.8)