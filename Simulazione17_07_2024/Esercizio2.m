%Michele Gabrieli
%MAT
close all; clear all; clc; 

a = -6; b = 23; N = 100000; K = 100; p = [-2.35; 0.46; 1.92; -5.87]; 
rng(13); 
x = a + (b-a) .* randn(N, 1)

T = zeros(K, 2); 
for i = 1 : K
    [z, tempi] = funzione(x, p); 
    T(i, :) = tempi; 
end

tempoMin = min(T); 
tempoMax = max(T); 
tempoMedio = sum(T) ./ K; 
fprintf("\ntempoMin: %g %g", tempoMin);
fprintf("\ntempoMedio: %g %g", tempoMedio);  
fprintf("\ntempoMax: %g %g", tempoMax); 
