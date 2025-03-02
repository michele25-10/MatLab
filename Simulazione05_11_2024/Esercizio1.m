%Michele Gabrieli
%Mat

c0 = max([log(3.1E-04); floor(-23/14); exp(pi)]); 
c1 = 0; 
c2 = 5 * cos(asin((pi^2) - 10.3)); 
c3 = 0; 
c4 = abs(sqrt(5.75e-02) + sin((3 * pi) / 5)); 
c5 = 0; 
c6 = - log2(4.2 + cos(0.77 * exp(1.3))); 
c7 = tan(1.37 * exp(2) - pi ^ (-0.6)); 

n = 100; 

c = [c7; c6; c5; c4; c3; c2; c1; c0]; 

x0 = input("Inserisci il punto in cui calcolare il valore: "); 
if(~isnumeric(x0)), error("Errore non hai inserito un numero"), end; 

[r0, q0] = ruffiniHorner(c, x0); 
[r1, q1] = ruffiniHorner(q0, x0); 
[r2, q2] = ruffiniHorner(q1, x0); 

fprintf("\n\nValore fx in x0: %g", r0); 
fprintf("\nValore der. prima in x0: %g", r1); 
fprintf("\nValore der. seconda in x0: %g", r2); 

fh = fplot(@(x)(polyval(c, x)), [-1.5, 1.6]); 

