%Michele Gabrieli
%MAT

close all; clear all; clc; 

n = 2; a = 0.8; b = 1.3; 
f = @(x)( 10^-3 .* exp(3 * pi - 2 .* (x.^2)) .* sin(-4 .* x) ); 

x = ((b - a) /2) * cos(pi * ((2 * (0:n) + 1) ./ (2 * n + 2))) + ((b+a)/2)
x = x'; y = f(x); 


xx = linspace(a, b, 401)'; 
yy1 = polyLagrange(x, y, xx); 

p = polyfit(x, y, n); yy2 = polyval(p, xx); 



fx = @(x)(81 * sin(3.*x)); 
xx = linspace(0.1, 0.95, 400)'; 
yy = fx(xx); 


n1 = [1:5]'; K = 3.^(n1); maggErr = 2 * (0.2125.^(n1)) .* K ./ factorial(n1)