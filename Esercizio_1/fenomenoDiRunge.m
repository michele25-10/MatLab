%restituisce un polinomio e accetta come parametri di ingresso i nodi di
%interpolazione e i nodi da interpolare

%intervallo [a, b] = [-1, 1]
a = -1; 
b = 1; 

i = 1; 
xx = linspace(a, b, 1000); 

%fx
fx = @(x)(1 ./ (1 + 25 * (x .^ 2))); 

for N = [10, 20, 30, 40, 50, 75, 100]
%genera due vettori di punti nell'intervallo [a,b] = [-1, 1]; 
% xE --> nodi equispaziati
xE = linspace(-1, 1, N); 
yE = fx(xE); 
% xCheb --> nodi di chebycef
xCheb = cos(((2 * (1:N) + 1)/(2 * (N + 1)))*pi); 
yCheb = fx(xCheb); 

%polinomi interpolanti equispaziati e di chebychef e relative y
% pE --> 
pE = polyfit(xE, yE, N-1); 
yPE = polyval(pE, xx); 
% pC -->
pC = polyfit(xCheb, yCheb, N-1); 
yPC = polyval(pC, xx);  

%dimostrazione con grafico del fenomeno di runge
% Grafico 1
disp(i); 
figure(i);
p1 = plot(xx, fx(xx), '--', xE, yE, 'o', xx, yPE, '-');
xlabel('x linspace');
ylabel('y-axis');
legend('fx su scala xx', 'punti equispaziati', 'y punti interpolazione', 'Location', 'best');
title('Sovrapposizione punti interpolazione e nodi di interpolazione equispaziati ', N );

% Grafico 2
figure(i+1);
p2 = plot(xx, fx(xx), '--', xCheb, yCheb, 'o', xx, yPC, '-');
xlabel('x-Chebyshev');
ylabel('y-axis');
legend({'fx su scala xx', 'punti chebyschef', 'y punti interpolazione'}, 'Location', 'best');
title('Sovrapposizione punti interpolazione e nodi di interpolazione Chebishev', N);

i = i + 2; 
end