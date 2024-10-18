function [ X ] = utrisol2( R, B )
%UTRISOL2 - Soluzione di sistema trinag. sup. (per colonne)
%   
[m, n] = size(B);   %m = numero di righe = numero di equazioni
                    %n = numero di colonne di B = numero di termini noti
X = zeros(m, n); 
X(m, :) = B(m, :) / R(m, m); 

for j = m-1 : -1 : 1
    B(1:j, :) = B(1:j, :) - R(1:j, j+1) * X(j+1, : );
    X(j, :) = X(j, :)/R(j, j); 
end
end

