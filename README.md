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

Parametri opzionali (vanno dopo i parametri obbligatori) nelle funzioni:

```matlab
function [out1, out2, varargout] = myFunc(in1, in2, varargin)
...
end

[a, b, c, d] = myFunc(A, B, R, S, T);
%varargout{1}=c     varargin{1}=R
%varargout{2}=d     varargin{2}=S
%                   varargin{3}=T

%nargout --> numero di parametro in out (conta anche quelli obbligatori)
%nargin --> numero di parametri in input
```

Si osservi che le variabili a, b e c non vengono modificate: il passaggio delle variabili
alle M-functions viene effettuato per valore, non per indirizzo.
Il workspace contenente le variabili utilizzate dalle M-functions è temporaneo e viene
liberato quando termina l'esecuzione delle istruzioni contenute nella M-function (le
variabili non passate in output vengono eliminate).

Le function_handle sono definite nel seguente modo:

```matlab
h = @(t, theta)( sin(t) + theta )
```

Quest'ultime possono anche essere inserite come argomento di una funzione ad esempio fplot.
In quel caso sono function_handle anonime ovvero nascoste nel workspace, non è richiamabile singolarmente.

# Matrici sparse

Quando il numero di elementi diversi da 0 non supera il numero di m (righe) o n (colonne).
Anche per le matrici sparse vale il discorso dell'allocazione dinamica.
Viene memorizzata in RAM (CSC):

- Un vettore di double che contiene tutti i vettori diversi da 0
- Un vettore di interi che contiene gli indici di riga di tutti gli elementi diversi da 0
- La colonna è un vettore di puntatore (1xn) che punta alla cella del primo valore di ogni colonna se la colonna è vuota allora punta alla colonna precedente, se il puntatore si ripete allora vuol dire che la colonna è di tutti 0.

Come noi istanziamo una matrice sparsa (COO):

- Dobbiamo inserire il valore dell'elemento
- L'indice della colonna
- L'indice della riga

Le operazioni sulle matrici sparse vengono eseguite in modo speciale attraverso l'indirizzamento indicizzato.
Usiamo una aritmentica sparsa.

comandi:

```matlab
M = sparse(i, j, m, nMax)

S = spdiags(B, d, m, n)

speye(m, n)

sprand(m, n, d, rc)
```

# Leggere dati da un file binari

```matlab
fid = fopen(filename, "rw")

[A, count] = fread(fid, num, precision, skip)
count = fwrite(fid, A, precision, skip);
```

# Grafica 3D

```matlab
[X, Y, Z] = peaks();

surf(X, Y, Z)       %colora la superfice
mesh(X, Y, Z)       %Mostra solo la rete delle x e y mossa dalle z
surfc(X, Y, Z)      %Mostra la superficie e riflesso sul pavimento x, y il contour
contour(X, Y, Z)    %Mostra su due punti le aree delle reti con punti di somiglianza (es. dislivello di un terreno)
pcolor(X, Y, Z)     %Mostra una griglia 2D e poi colora le aree dentro la griglia attraverso i valori delle z nello spazio

%Modificare la vista del grafico ruota sull'asse z e ruota l'angolo di visione (altezza sopra sotto).
view(-140, 60);

```

Crea una griglia prima di intersezione tra X e Y nei punti di intersezione tra gli elementi, dopo di chè le innalza attraverso l'uso delle Z.
Questo consente di creare grafici 3D attraverso l'uso di griglie prevalentemente rettangolari.
La colorazione della rete varia in genere in base al numero delle x contenute all'interno di quel rettangolo della rete.
