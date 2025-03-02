%Michele Gabrieli   
%MAT

close all; clear all; clc; 

p = zeros(7, 1); 
p(1) = -cos(0.3 + exp(1.7)); %c6
p(7) = min([log(pi ^ 3); 3/2; exp(3.5)]); %c0
p(6) = log2(sqrt(pi) * max([exp(7) - 3; tan(12.8)])); %c1
p(4) = (13/7) - asin(0.24 * pi); %c3
p(2) = sin(-(57.3 * exp(2.7)) ^ (1/5)); %c5

x0 = input("Inserisci punto x0: "); 
while(~isnumeric(x0))
    x0 = input("X0 deve essere numerico. Inserisci punto x0: "); 
end

[r, q0] = ruffiniHorner(p, x0); 
[derp, q1] = ruffiniHorner(q0, x0); 
[ders, q2] = ruffiniHorner(q1, x0); 

fprintf("\n\nValore x0 in p6: %g", r); 
fprintf("\nValore x0 in derivata prima: %g", derp); 
fprintf("\nValore x0 in derivata seconda: %g", 2 * ders); 

fplot(@(x)(polyval(p, x)), [-3/4, 2]); 








