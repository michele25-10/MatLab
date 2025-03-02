%michele Gabrieli
%MAT

close all; clear all; clc; 

x = rand(100, 1) .* 10; 
s = 5; w = 1; 
[y1, index, tMedio] = funzione(x, s, w); 

disp(y1); 
fprintf("\n\nValore delle tMedio1 =%g", tMedio);

s = input("Inserisci s: "); 
w = input("Inserisci w diverso da 0: "); 

[y2, index, tMedio] = funzione(x, s, w); 
fprintf("\n\nValore delle tMedio2 =%g", tMedio);

x2 = x(index(1:end));  

figure(1); 
plot(x, y1, "or", x2, y2, "ob"); 
xlabel("Valori ascisse"); 
ylabel("Valori ordinate"); 
legend(["s = 5 w = 1", "s e w scelti da utente"]); 
 



