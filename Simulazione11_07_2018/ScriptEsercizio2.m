%Michele Gabrieli
%MAT

close all; 
clear all; 
clc; 

a = -3; b = 3; N = 50; 
 
for k = 1 : 0.1 : 10
    [xx, y] = Esercizio2(k, a, b, N); 
    
    disp(xx); disp(y); 

    plot(xx, y, "-b"); 
    title(sprintf("Valore di k = %d", k)); 
    xlabel("x equispaziati"); 
    ylabel("Valori funzione"); 
    xlim([-1, 20]);
    pause(0.05); 
end