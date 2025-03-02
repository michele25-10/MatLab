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



%Ripeto quanto sopra con un polinomio di grado 5; 
n = 5; 
x = ((b - a) /2) * cos(pi * ((2 * (0:n) + 1) ./ (2 * n + 2))) + ((b+a)/2)
x = x'; y = f(x); 

yy_1 = polyLagrange(x, y, xx); 
p = polyfit(x, y, n); yy_2 = polyval(p, xx); 

figure(1); 
plot(xx, f(xx), "-b"); 
hold on; 
plot(xx, yy1, "-r", LineWidth=4.5); plot(xx, yy2, "-k"); 
hold off; 
xlabel("Valori delle ascisse"); 
ylabel("Valori polinomi interpolanti"); 
xlim([a, b]);
legend(["fx", "polyLagrange", "polyfit"]); 
title("N = 2"); 


figure(2); 
plot(xx, f(xx), "-b", xx, yy_1, "-r", xx, yy_2, "--g"); 
xlabel("Valori delle ascisse"); 
ylabel("Valori polinomi interpolanti"); 
xlim([a, b]);
legend(["fx", "polyLagrange", "polyfit"]); 
title("N = 5"); 