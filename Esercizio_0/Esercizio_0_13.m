xs = ones(10, 1); 
y = 2 * randn(10, 1); 

%restituisce il valore assoluto di ogni elemento della matrice contente la
%sottrazione tra una lista di 1 e y un numero randomico tra 0 e 2
abs(xs-y); 

%restituisce la norma Euclidea
norm(xs-y) / norm(xs)

%divisione tra xs-y valore assoluto e xs in valore assoluto componente per
%componente
abs( xs - y) ./ abs( xs ); 

