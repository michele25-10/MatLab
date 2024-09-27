%Esercizio_01 - Primo esercizio di Matlab --> 27/09/2024
% M-script --> Primio esercizio con quesiti da 1 a 12
%
%V. 1.0 

%defininzione delle MATRICI
v = [1; 2; 3; 4; 5; 6]; 
w = [1; 2; 3; 4; 5; 6]; 

%Oppure posso definire le matrici anche così
%v = [1 2 3 4 5]' --> l'apostrofo indica il trasposto
%v = [1, 2, 3, 4, 5] --> è una riga --> matrice da una 5 colonne e una riga
%v = [1:6]' --> genera in automatico un vettore con valori da 1 a 6

%se non vuoi la visualizzazione da console alla fine di un comando
%inserisci il ";", se non metto niente allora alla fine della operazione mi
%stampa a console il risultato.

a = v+w 
b = 4*v  
c = v.*w 
d = w/2 
e = v./w
f = v' * w,  %f = dot(v, w); 
g = 2*v - 6*w

%([indice di partenza: step di movimento: fino alla fine])
g1([2:2:6]) = d([2:2:6])
g1([1:2:6]) = c([1:2:6])

%se faccio una assegnazione fuori range di un array non genera errore, lo
%genera però in caso di accesso ad un valore di un array fuori indice

h = [v; v; v; v; v]
%oppure posso usare la funzone repmat nel caso in cui avessi 50 volte il
%vettore v --> h = repmat(v, 5, 1); replica v su 5 righe e una colonna.

h(5:5:end) = 0
h(6:6:end) = 1

u = 1:6; 
k = w*u