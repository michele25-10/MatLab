%Michele Gabrieli   
%MAT

close all; clear all; clc; 

rng("default"); 
N = 12; a = 0; b = 3; 
x = a + (b - a) * rand(N, 1); 
f = @(x)(cos(x) .* sin(sqrt(x) + 3)); 
y = f(x); 

A = [x.^2, x, ones(N, 1)]; 
p = (A' * A) \ (A' * y); p = p'; 

xx = linspace(a, b, 401); yy = f(xx); 
yy2 = polyval(p, xx); 

figure(1); 
plot(xx, yy, "-b", x, y, "ob", xx, yy2, "-r"); 
xlim([a, b]); 
xlabel("Ascisse"); ylabel("Valori funzione"); 
legend(["funzione", ...
    "punti estratti random", ...
    "polinomio interpolante grado due"] ...
); 


