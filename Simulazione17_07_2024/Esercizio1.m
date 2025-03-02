%Michele Gabrieli
%MAT
close all; clear all; clc; 

p = zeros(8, 1); 
p(8) = min([0.6 * pi^(-3); -sqrt(3.1); -8.51E-7]);  %c0
p(7) = 15.4 - sqrt(7.32 * asin(exp(3)/tan(-1.611))); %c1
p(6) = - floor(0.005E+03 * (pi / 23)); %c2
p(4) = acos(tan(0.64) - log10(sin((2 * pi ^ 2) - 3.43E-2)));%c4 
p(2) = 0.025 * log((0.21 ^ -0.07) + 4); %c6
p(1) = - abs(max([0.25 * exp(-1.2); 0.77 * (pi ^ 1.06)]) - log2(5/pi)); %c7

x0 = input("Inserisci punto x0: "); 
while(~isscalar(x0))
    x0 = input("Il punto deve essere numerico. Inserisci punto x0: "); 
end

[r, q0] = ruffiniHorner(p, x0); 
[derp, q1] = ruffiniHorner(q0, x0); 
[ders, q2] = ruffiniHorner(q1, x0); 

fprintf("\n\nValore x0 nel polinomio: %g", r); 
fprintf("\nValore x0 nella derivata prima: %g", derp); 
fprintf("\nValore x0 nella derivata seconda: %g", 2 * ders); 

fplot(@(x)(polyval(p, x)), [-1.5, 1.2]); 

