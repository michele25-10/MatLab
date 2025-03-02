%Michele Gabrieli
%MAT

close all; 
clear all; 
clc; 

p(1) = tan(1.37 * (pi^2) - exp(-0.6)); %c7
p(2) = -log10(4.2 + sin(0.77 * exp(1.3))); %c6 
p(3) = 0; %c5
p(4) = abs(sqrt(5.7 * 10^(-2)) + cos((-3 * pi) / 5)); %c4
p(5) = 0;  %c3
p(6) = 5 * cos(sin(12.3 - pi^(2.1)));  %c2
p(7) = 0; %c1
p(8) = log(3.1 * 10^(-4)); %c0

x0 = input("Inserisci punto x0: "); 
while(~isnumeric(x0))
    x0 = input("x0 deve essere un numero --> Inserisci punto x0: "); 
end

[r, q] = ruffiniHorner(p, x0); 
[derp, q1] = ruffiniHorner(q, x0); 
[ders, q2] = ruffiniHorner(q1, x0); 

fprintf("\n\nValore in x0: %g", r); 
fprintf("\nValore derivata prima in x0: %g", derp); 
fprintf("\nValore derivata seconda in x0: %g", 2*ders); 

fp = fplot(@(x)(polyval(p, x)), [-1.7, 2.0], "-b"); 
