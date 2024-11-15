function [ X ] = ltrisol(L, B)
% ltrisol - Soluzione di sistemi triangolari inferiori multipli
% Data una matrice L triangolare inferiore di ordine m e 
% una matrice B con m righe ed n colonne, risolve n sistemi lineari 
% L * x = B_j, dove B_j è la j-esima colonna di B. Nella colonna j-esima 
% di X viene salvata la soluzione relativa alla j-esima colonna di B.
%
% SINTASSI:
%   [ X ] = ltrisol( L, B )
% INPUT:
%   L (double array) - Matrice dei coefficienti dei sistemi (triangolare inferiore)
%   B (double array) - Matrice dei termini noti: la j-esima colonna contiene
%                      il vettore dei termini noti relativi al j-esimo sistema
%                      da risolvere
% OUTPUT:
%   X (double array) - Matrice delle soluzioni del sistema matriciale AX = B; 
%                      nella j-esima colonna è contenuta la soluzione del
%                      j-esimo sistema.

tol = eps * norm(tril(L), 'inf');

% Controllo della singolarità
if any(~diag(L))
    error('Matrice L singolare');
elseif any(abs(diag(L)) < tol)
    warning('Presenza di elementi diagonali molto piccoli: possibile amplificazione degli errori di arrotondamento');
elseif ~istril(L)
    warning('Matrice non triangolare inferiore: verra'' usato solo triu( L )');
end

% Dimensioni della matrice L
[mL, nL] = size(L);
% Dimensioni della matrice B
[mB, nB] = size(B);

% Controlli sulle dimensioni delle matrici:
if mL ~= mB
    error('Le due matrici devono avere lo stesso numero di righe.');
elseif mL ~= nL
    error('La matrice L deve essere quadrata.');
end

X = B; % inizializzazione 

% Approccio per colonne, sull'intera sottomatrice di termini noti
X(1, :) = X(1, :) / L(1, 1);
for i = 2:mL
    % matrice meno diade
    X(i:mL, :) = X(i:mL, :) - L(i:mL, i-1) * X(i-1, :);
    X(i, :) = X(i, :) / L(i, i);
end

end
