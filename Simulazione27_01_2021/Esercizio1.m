%michele Gabrieli
%MAT

close all; clear all; clc; 

p = zeros(7, 1); 
p(1) = log10(pi^(7/4) * max([exp(2) - 5; tan(1/2)])); %c6
p(2) = cos((abs(-0.7 * exp(-0.2)))^(1/3)); %c5
p(4) = -sin(0.2 + exp(-1.6)); %c3
p(6) = acos(3.7 * 10 ^(-1)) + 1/4; %c1
p(7) = log(sqrt(pi^3) + 2/3); %c0

x0 = input("Inserisci il valore del punto x0: "); 
while(~isnumeric(x0))
    x0 = input("x0 deve essere un valore numerico: Inserisci x0: "); 
end

[r0, q0] = ruffiniHorner(p, x0); 
[derp, q1] = ruffiniHorner(q0, x0); 
[ders, q2] = ruffiniHorner(q1, x0);

fprintf("\n\nValore della fx: %g", r0); 
fprintf("\nValore della derivata prima: %g", derp);
fprintf("\nValore della derivata seconda: %g", 2 * ders);

fplot(@(x)(polyval(p, x)), [-1.5 1.3]); 


