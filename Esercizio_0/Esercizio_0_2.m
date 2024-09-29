%Esercizio_02 - Secondo esercizio di Matlab --> 27/09/2024
% M-script --> Secondo esercizio con quesiti da 1 a 5
%
%V. 1.0 

%prendo un valore in input 
n = input('\nIntrodurre la dimensione della matrice n = '); 

%nella matrice A avente dimensione n*n di valori compresi tra 0 e 1
%generati casualmente
A = rand(n)

%di default sum fa le somme lungo le colonne, se voglio sommare lungo le
%righe con comando da shell "help sum" mi dice come fare
sumCols = sum(A) 
sumRows = sum(A, 2) %somma lungo le righe
sumRowsSquare = sum(A.*A, 2) 

%se c'è da fare un elevamento a potenza di bassa portata tipo ^2 o ^3 è
%molto più efficiente scriverlo come prodotto.

%Anche la funzione max(A) lavora di default sulle colonne. Per trovare il
%massimo della riga devo inglobare --> max(max(A))
max(max(A))

%notazione degeni A(:) mi inserisce tutte le colonne in una unica colonna
%contigua --> esattamente come viene memorizzato nella RAM. 
%In C le matrici sono array di array: non sono contigui in memoria questo
%aumenta le cache miss... quindi sarà anche meno efficiente perchè andra a
%pescare i dati dalla memoria.
%Fortrun invece gestisce le matrici come più vettori contigui... questo
%diminuisce la probabilità di cache miss.

sumALL = sum(A(:))