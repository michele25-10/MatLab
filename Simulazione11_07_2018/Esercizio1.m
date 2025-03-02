%Michele Gabrieli
%MAT
close all;
clear all; 
clc; 

while(x0 <= 0)
    x0 = input("Valore negativo. Inserisci un numero reale positivo: "); 
end

pp = [7; 0; 0; -4; 0; 1; 1; -3; -5; -7]; 

[px, q0] = ruffiniHorner(pp, x0); 
[p1x, q1]= ruffiniHorner(q0, x0); 
[p2x, q2] = ruffiniHorner(q1, x0); 

fprintf("\n\nValore funzione in x0: %g", px); 
fprintf("\nValore der. prima in x0: %g", p1x); 
fprintf("\nValore der. seconda in x0: %g\n\n", p2x); 

disp("Verifica dei valori con polyval"); 
pv0 = polyval(pp, x0); 
pv1 = polyval(q0, x0); 
pv2 = polyval(q1, x0); 

fprintf("\n\nValore funzione in x0: %g", pv0); 
fprintf("\nValore der. prima in x0: %g", pv1); 
fprintf("\nValore der. seconda in x0: %g", pv2); 

