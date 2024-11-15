function [ X ] = utrisol2(R, B)
%utrisol2 - Soluzione di sistemi triangolari superiori multipli
% Data una matrice R triangolare superiore di ordine m e 
% una matrice B con m righe ed n colonne, risolve n sistemi lineari 
% R x = B_j, dove B_j e' la j-esima colonna di B. Nella colonna j-esima 
% di X viene salvata la soluzione relativa alla j-esima colonna di B.
%
% SINTASSI:
%   [ X ] = utrisol2( R, B )
% INPUT:
%   R (double array) - Matrice dei coefficienti dei sistemi (triangolaresuperiore)
%   B (double array) - Matrice dei termini noti: la j-esima colonna contiene
%                      il vettore dei termini noti relativi al j-esimo sistema
%                      da risolvere
% OUTPUT:
%   X (double array) - Matrice delle soluzioni del sistema matriciale AX = B; 
%                      nella j-esima colonna e' contenuta la soluzione del
%                      j-esimo sistema.

tol = eps * norm( triu( R ), 'inf' );

% controllo della singolarita'
if ( any( ~diag( R ) ) )
    error('Matrice R singolare');
elseif ( any( abs( diag( R ) ) < tol ) )
    warning('Presenza di elementi diagonali molto piccoli: possibile amplificazione degli errori di arrotondamento');
elseif ( ~istriu( R ) )
    warning('Matrice non triangolare superiore: verra'' usato solo solo triu( R )');
end

% Dimensioni della matrice R
[mR, nR] = size( R );
% Dimensioni della matrice B
[mB, nB] = size( B );
% Controlli sulle dimensioni delle matrici:
if ( mR ~= mB )
    error('Le due matrici devono avere lo stesso numero di righe.');
elseif ( mR ~= nR )
    error('La matrice R deve essere quadrata.');
end

X = B; % inizializzazione 

% Approccio per righe, una colonna di termini noti per volta
% for j = 1:nB
%     X(mB, j) = X(mB, j) / R(mR,mR);
%     for i = (mB-1) : -1 : 1
%         % SDOT
%         X(i, j) = X(i, j) - R(i, (i+1):mR) * X((i+1):mR, j);
%         X(i, j) = X(i, j) / R(i,i);
%     end
% end

% Approccio per colonne, sull'intera sottomatrice di termini noti
X(mB, :) = X(mB, :) / R(mR, mR);
for i = (mB-1) : -1 : 1
    % matrice meno diade
    X(1:i, :) = X(1:i, :) - R(1:i, i+1) * X(i+1, :);
    X(i, :) = X(i, :) / R(i, i);
end

end