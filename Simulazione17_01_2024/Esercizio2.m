%Michele Gabrieli   
%MAT

close all; clear all; clc; 
rng("default"); 
params = [2; 1.5; 1.3; -1.75]; 
N = 10^6; 
x = randn(N, 1); 


tic; y = funzione(x, params); tempoVett = toc; 


ffx = []; i = 1; 
tic; 
for k = 1 : numel(x)
    [tmp] = funzione(x(k), params); 
    if(~isempty(tmp))
        ffx(i) = tmp; 
        i = i + 1; 
    end
end
tempoCiclo = toc; 

fprintf("\n\nTempoCiclo: %g", tempoCiclo); 
fprintf("\n\nTempoVettoriale: %g", tempoVett); 




