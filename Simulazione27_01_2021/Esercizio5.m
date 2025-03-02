%Michele Gabrieli
%MAT

close all; clear all; clc; 

n = 10; 
a = -4.5; b = -2.5; 

x = a + (b - a) .* randn(n, 1); 
disp(x); 
f = @(x) ((log(x + 5) - 1) .* cos(x)); 
y = f(x); 

A = ones(n, 3); 
A(:, 1:2) = x .^ (2:-1:1); 

coeff = (A'*A) \ (A'*y); 
c2 = polyfit(x, y, 2); 

xx = linspace(a, b, 401)'; 
yy = polyval(coeff', xx); 

figure(1); 
plot(xx, f(xx), "-b", x, y, "or", xx, yy, "--k"); 
xlabel("ascisse"); 
ylabel("ordinate"); 
legend(["fx", "nodi", "ris. polinomio interpolante"]); 
xlim([a, b]); 

