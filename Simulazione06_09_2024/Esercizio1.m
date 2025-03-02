%Michele Gabrieli  
%MAT

clear all; close all; clc; 

p = zeros(7, 1); 
p(1) = -log(sqrt(factorial(5))); %c6
p(2) = -log10(0.314/pi^3); %c5
p(3) = min([3.7E2, -tan(exp(1) * pi), 0.23^5]); %c4
p(5) = -tan(pi / 4) + log2(abs(sin(-7.3))); %c2
p(6) = cos(3 * sqrt(2 * exp(-3))); %c1
p(7) = abs(sin(7 * pi / 9.076) * (exp(2)^1/3)); 

x0 = input("Inserisci il punto x0: "); 
while(~isnumeric(x0))
    x0 = input("Deve essere un numero. Inserisci il punto x0: "); 
end

[r, q0] = ruffiniHorner(p, x0); 
[derp, q1] = ruffiniHorner(q0, x0); 
[ders, q2] = ruffiniHorner(q1, x0); 


fprintf("\n\nValore di x0 del polinomio: %g", r); 
fprintf("\nValore di x0 della der. prima: %g", derp); 
fprintf("\nValore di x0 della der. seconda: %g", 2 * ders); 

fplot(@(x)(polyval(p, x)), [-0.95, 0.70]); 




