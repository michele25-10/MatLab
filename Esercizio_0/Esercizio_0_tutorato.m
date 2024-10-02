%Scrivere un programma che esegua la conversione di un numero reale
%qualunque da base 10 usando le funzioni di matlab

x = input("\nInserisci un numero in base 10: "); 
b = input("\nDefinisci la base in cui convertire: "); 

r = 0; 
q = x; 
s = ""; 

while q ~= 0
    r = mod(q, b);
    q = fix(q / b);
    s = strcat(s, "" + r)
end

disp(s);  