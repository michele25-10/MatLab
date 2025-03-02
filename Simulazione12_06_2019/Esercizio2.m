%MIchele Gabrieli
%MAT

close all; clear all; clc; 

a = -1.5; b = 2.3; alpha = 2; beta = 1.2; N = 2001; 

x = linspace(a, b, N)'; 

n = numel(x); 
fx = zeros(n, 1); 

tic; 
for k = 1 : n
    fx(k) = funzione(alpha, beta, x(k)); 
end
tempoCiclo = toc; 

tic; 
z = funzione(alpha, beta, x); 
tempoVett = toc;

fprintf("\n\ntempo del ciclo: %g", tempoCiclo); 
fprintf("\ntempo chiamata a funzione ottimizzata: %g", tempoVett); 
fprintf("\nDifferenza: %g", abs(tempoVett - tempoCiclo) / tempoCiclo); 
fprintf("\ntempo chiamata a funzione ottimizzata: %g %", ...
    (tempoVett/tempoCiclo)*100); 

figure(1); 
plot(x, z, "-r"); 
xlim([a, b]); 
xlabel("Ascisse"); ylabel("Valore fi(x)"); 