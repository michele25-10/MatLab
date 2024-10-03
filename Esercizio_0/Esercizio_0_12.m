A = [1 2 3;  4 5 6]; 
B = [2 2 1; 1 0 3]; 
x = [1 2 3];
y = [4 5 6];

%prodotto di ogni componente di A per quello nella stessa posizione del
%componente di B
C = A.*B; 

%prodotto della prima riga per tutte le colonne per y
z = A(1,:) .* y; 

%divisione della matrice x per la matrice composta da tutte le righe della
%colonna 2 e come ultima riga 3.
z = x ./ [B(:, 2); 3]; 

%x è il divisore y il dividendo
z = x.\y; 

%Elevo tutta la seconda riga di A per tutta la prima riga di B presa da 
%destra verso sinistra 
z = A(2, :) .^ B(1, 3:-1:1); 
