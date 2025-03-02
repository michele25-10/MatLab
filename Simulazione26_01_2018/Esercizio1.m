%Michele Gabrieli
%MAT
disp("Esercizio 1"); 

p = [3; -9; 0; 11; -pi; 0; -2]; 

x0 = input("Inserire il punto (numero reale) nel quale valutare " + ...
    "il polinomio: x0 = "); 
if(isempty(x0) || ~isnumeric(x0)), error("Inserisci un numero come x0"), end; 

[r0, q0] = ruffiniHorner(p, x0); 
[der1, q1] = ruffiniHorner(q0, x0); 
[der2, q2] = ruffiniHorner(q1, x0); 

fprintf("\n\nValore del polinomio in x0: %g", r0); 
fprintf("\nValore della derivata prima in x0: %g", der1); 
fprintf("\nValore della derivata seconda in x0: %g", der2); 
