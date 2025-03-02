%MIchele Gabrieli   
%MAT

close all; clear all; clc; 

p = zeros(7, 1); 
p(1) = -exp(-pi); 
p(2) = -1.4; 
p(3) = 1; 
p(5) = -log(207.13); 
p(7) = 3 * pi; 

x0 = input("Inserisci un numero x0: "); 
while(~isscalar(x0))
    input("Valore negativo. Inserisci un numero x0: "); 
end

[r, q0] = ruffiniHorner(p, x0); 
[derp, q1] = ruffiniHorner(q0, x0); 
[ders, q2] = ruffiniHorner(q1, x0); 

fprintf("\n\nIl valore del polinomio in x0: %g", r); 
fprintf("\nIl valore in x0 della derivata prima: %g", derp); 
fprintf("\nIl valore in x0 della derivata seconda: %g", ders * 2);

fplot(@(x)(polyval(p, x)), [0.8, 1.7]); 



