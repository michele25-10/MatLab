A = [1 2 3; 4 5 6; 7 8 9];  
B = [2 -1 0; -1 2 -1; 0 -1 2]; 

%per tutte le righe di A nelle colonne 1 e 3 saranno uguali a tutte le
%righe di b per le colonne che vanno da 1 a 2
A(:, [1,3]) = B(:, 1:2); 

%ogni elemento di A diviso ogni elemento di B nelle loro stesse posizioni
C = A./B; 

%Ogni elemento di A elavato ad ogni elemento di b
C = A.^B; 

%la somma del triangolo superiore della matrice A sommato al triangolo
%inferiore della matrice b con la diagonale spostata di uno a sinistra.
C = triu(A) + tril(B, -1); 

%Elimina le per le righe da 1 a 2 e tutte le colonne della matrice A
A([1:2], :) = []; 

%la matrice D conterrà i valori di B delle righe 3 e 2 e delle colonne da 1
%a 3 con step di 2
D = B([3,2], 1:2:3); 