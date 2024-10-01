A = [2 2 1; 1 -1 4; 2 1 -3]; 

%p --> contiene numero di righe, q --> contiene numero di colonne
[p,q] = size( A(1:2,1:2) ); 

%La divisione di ogni elemento di A per l'elemento della matrice A' nella
%stessa posizione.
A./A'; 

%prodotto elemento per elemento della seconda riga e tutte le colonne * la
%terza riga per tutte le colonne.
A(1,:) = A(2,:) .* A(3,:);

% la seconda riga della matrice A è uguale alla 1 colonna trasposta
A(2,:) = A(:,1)'

%elevo alla 3 tutta la seconda colonna della matrice A
A(:,2) = A(:,2).^3;