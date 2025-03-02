%Michele Gabrieli
%MAT

abN = [-2, 2, 401]; 
xx = linspace(-2, 2, 401); 

i = 1; 
for k = 2 : 0.25 : 6
    yy = Esercizio2(abN, k); 
    
    figure(i); 
    plot(xx, yy, "-r"); 
    xlim([-8, 8]); 
    xlabel("Valori delle x equispaziati"); 
    ylabel("Valori calcolati dalla M-fx");
    title("Funzione con k = " + k);
    
    t = timer("Period", 2500);
    i = i + 1; 
    wait(t);

end