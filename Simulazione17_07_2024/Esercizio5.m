%Michele Gabrieli
%MAT

clear all; clc; close all; 

a = -1; b = 1; n = 5; g = @(x)(exp(-x / 2)); 

tj = cos(((2 * (n:-1:0) + 1)./(2 * (n+1))).*pi)'; 
x = ((b-a)/2) .* tj + ((b+a)/2); 
y = g(x); 
d = tabDiff(x, y); 
xx = linspace(a, b, 401); yy1 = g(xx); 
p = d(n) * ones(size(xx)); 
for k = n-1 : -1 : 1 
    p = p .* (xx - x(k)) + d(k); 
end

yy2 = polyval(p, xx); 
p2 = polyfit(x, y, 5); yy3 = polyval(p2, xx); 

figure(1); 
hold on; 
plot(xx, yy1, "-b", LineWidth=2); 
plot( xx, yy2, "-r"); 
plot(x, y, "ob"); 
plot(xx, yy3, "-k")
hold off; 
title("Esercizio 5"); 
legend(["g(x)", "Interpolazione tabDiff", "Nodi chebychev", "polyfit"]); 
xlabel("Ascisse"); ylabel("Valori g(x) o p5(x)"); 


