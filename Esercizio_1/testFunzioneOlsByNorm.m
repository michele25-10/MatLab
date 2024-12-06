%Test per la soluzione del problema lineare ai minimi quadrati con modello
%polinomiale algebrico

%imposto il seed
rng(1234); 

%intervallo delle x
a = -7; b = 19; 

nPunti = 20; 
gradoPol = 5; 

x = sort(rand(nPunti, 1) * (b - a) + a); 

f = @(x)( 2 * cos(-2 * x + 1.7 ) );
y = f(x); 

%sommiamo delle perturbazione casuali tra lo 0 e il 20 percento
y = y .* (0.8 + rand(size(x)) * 0.4); 

% p contiene i coefficenti del polinomio interpolante
[p] = olsByNormEq(x, y, gradoPol); 
%trovo i valori delle y sostituendo le x dentro il polinomio interpolante
yy = polyval(p, xx); 

xx = linspace(a, b, 201)'; 
ff = f(xx); 

%grafico con risultati perfetti della funzione e con risultati delle x nel
%polinomio interpolante (yy)
plot(x, y, '.');  
hold on;
plot(xx, [ff, yy]);
hold off; 

%polyfit trova il polinomio interpolante
p1 = polyfit(x, y, gradoPol)'; 

%istruzione find restituisce un vettore di indici che contiene gli indici
%delle posizioni dell'array dato in input rispetto alla condizione che do
%in input


