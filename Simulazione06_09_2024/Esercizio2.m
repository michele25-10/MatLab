%Michele Gabrieli  
%MAT

clear all; close all; clc; 

a = -6.0; b = 8.0; N = 150001; 
alpha = 2.2; beta = -4.1; gamma = 0.73; delta = -1.85; 
K = [alpha, beta, gamma, delta]'; 
x = linspace(a, b, N)'; 

fx=[]; 

tic; 
for k=1:N
    fx(k) = funzione(K, x(k)); 
end
tempoCiclo = toc; 


tic
z = funzione(K, x);     
tempoVett = toc

fprintf("\n\nTempoCiclo: %g", tempoCiclo); 
fprintf("\nTempoVett: %g", tempoVett); 
fprintf("\nLa percentuale di tempoVett: %3.2f", (tempoVett/tempoCiclo)*100); 

figure(1); 
plot(x, z, "-b"); 
xlim([a, b]); 