# MatLab

Esercizi di laboratorio di Calcolo Numerico

# Informazioni teoriche e Best Practices

- Le prime righe di un file m-script dovrebbero contenere commento di cosa fa il suo contenuto. Questo commento viene visualizzato se da shell scriviamo il seguente comando "help nomeScript".

```matlab
%Esercizio_01 - Primo esercizio di Matlab --> 27/09/2024
% M-script --> Primio esercizio con quesiti da 1 a 12
%
%V. 1.0
```

- Nella variabile ans troviamo il risultato dell'ultima operazione digitata.
- Matlab è ottimizzato per il calcolo matriciale e tutti i dati vengono visti come matrici (vedi commenti Esercizio_0_2.m, spiegano bene le differenze tra C e MatLab).

* Non è possibile sommare vettori di dimensioni differenti: la somma, differenza e la differenza sono calcolate componente per componente.
  Il prodotto tra due matrici corrisponde al loro prodotto scalare.
* Le operazioni di divisione, moltiplicazione ed elevamento a potenza non sono definite
  per i vettori, ma è possibile utilizzare le operazioni punto: .\* ./ .^ .\
* Operatori di confronto:
  - == confronto
  - \> maggiore
  * < minore
  * \>= maggiore o uguale
  * \> <= minore o uguale
  * \> ~= diverso
* Gli opertori logici:
  - & o &&: AND
  - | o ||: OR
  - ~: NOT
* Allocazione dinamica della memmoria --> Matlab è in grado di creare "spazio" (memoria) dinamicamente in caso di necessità.
* E' possibile confrontare gli elementi di due matrici, il confronto viene fatto elemento per elemento --> il risultato è una matrice i cui elementi sono valori logici: 0 false, 1 true.
* Per Matlab qualunque valore diverso da 0 è uguale a TRUE
* Per evitare eseguire i calcoli matriciali evitare il più possibile i cicli for.
* Le stringhe sono vettori di caratteri, una frase è un vettore riga di stringhe

# Sintassi

```matlab
%Si crea una variabile vuota NULL che può contenere qualsiasi tipo di dato
x = []

%Serve a far visualizzare il valore della variabile a schermo
disp(x)

%Viene usato come in c
fprintf("il valore di a: %f", a)

%Prende il valore in input e lo assegna alla variabile x
x = input("Inserisci il valore della variabile x:\n");

%STRUCT --> per accedere ad un campo della struttura S.Nome
S = struct('Nome', 'Cleve', ...
            'Cognome', 'Moler', ...
            'Anno', 1939);
%Modificare i valori
S.Nome = 'Jack';
S.Cognome = 'Little';
S.Anno = 1956;

%Si possono creare vettori di strutture, sfruttando l'allocazione dinamica della memoria di Matlab.
S(1).Nome = 'Frank';
S(1).Cognome = 'Herbert';
S(1).Anno = 1920;
S(2).Nome = 'Isaac';
S(2).Cognome = 'Asimov';
S(2).Anno = 1920;

%CELL ARRAY
%I cell array sono particolari tipi di dato che possono contenere dati di qualsiasi tipo. La creazione di questo tipo di dato segue una notazione vettoriale.
A = cell(2,2); % Viene inizializato il cell array
A{1,1} = 'ciao'; % elemento di posto 1,1
A{1,2} = 4; % elemento di posto 1,2
A{2,1} = [1,2]; % elemento di posto 2,1
A{2,2} = [4;3]; % elemento di posto 2,2

%MATRICI
%dichiarazioni di vettori riga
v = [12, pi, 0];

%dichiarazione di vettori colonna
w = [9; 42; 0];

%per accedere agli elementi di un vettore
disp(w(2)) %ans = 42

%per accedere ad una matrice esempio riga 2 colonna 3
disp(w(2, 3))

%questo comando crea vettore b i cui elementi sono b = (3,4,5,...,15)
b = 3:15;

%Questo comando crea il vettore c i cui elementi sono equispaziati di passo 0.1. c =(0, 0.1, 0.2, . . . , 1.8, 1.9, 2)
c = 0:0.1:2;

%Usando l'apostrofo si calcola il trasposto di un vettore.


%CICLI
%if stessa sintassi di assembly
if condition1
    instructions_1
elseif condition2
    instructions_2
elseif condition_n
    instructions_n
else
    instructions
end

%switch case, se non soddisfa nessuna condizione entra in otherwise
switch var
    case number_1
        instruction_1
    case number_2
        instructions_2
    otherwise
        instructions_o
end

%for
v = 1:10;
for ii = 1:10
    v(ii) = v(ii) - ii^2;
end

%while --> ovviamente assicurati che esca dal ciclo ;)
while cond_1
    instructions
end

```

# M-function

Il nome della funzione deve avere lo stesso nome del file e può essere preceduta solamnente da commenti.

Non è più obbligatorio chiudere una function con un end --> la best practice del corso consiglia di inserire l'end finale.

Le function di per se non dovrebbero mai avere interazioni con l'utente.

Tutti i parametri in input ad una risorsa sono passati per valori, quindi in RAM avrò la copia delle variabili in input come parametri della funzione, potrebbe essere dispendioso in certi casi.

Ci sono dei metodi per passare i parametri delle funzioni per riferimento.

```matlab
function [x1, x2] = roots_deg2(a, b, c)
%ROOTS_DEG2 - Calcolo delle soluzioni dell'eq. di II grado.
% SINTASSI: [x1, x2] = roots_deg2(a, b, c)
% INPUT: a, b, c (coefficienti)
% OUTPUT: x1, x2 (soluzioni)
x1 = []; x2 = []; % le variabili di output sono inizializzate vuote
Delta = b^2 - 4*a*c; % calcolo del discriminante
switch sign(Delta)
    case -1
        fprintf('L''eq. non ha soluzioni reali.\n')
        return; % uscita dalla funzione
    case 0
        fprintf('L''eq. ha due soluzioni reali coincidenti:\n')
        x1 = -b/(2*a);
        x2 = x1;
        fprintf(' x1 = x2 = %f \n', x1);
    case 1
        fprintf('L''eq. ha due soluzioni reali distinte:\n')
        x1 = (-b - sqrt(Delta))/(2*a);
        x2 = (-b + sqrt(Delta))/(2*a);
        fprintf(' x1 = %f \n x2 = %f \n', x1, x2);
end % termine del costrutto switch
end % termine della M-function
```

Si osservi che le variabili a, b e c non vengono modificate: il passaggio delle variabili
alle M-functions viene effettuato per valore, non per indirizzo.
Il workspace contenente le variabili utilizzate dalle M-functions è temporaneo e viene
liberato quando termina l'esecuzione delle istruzioni contenute nella M-function (le
variabili non passate in output vengono eliminate).

# Grafica 2D
