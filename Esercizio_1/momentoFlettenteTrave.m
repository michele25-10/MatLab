%MOMENTOFLETTENTETRAVE - Calcolo delle sollecitazioni meccaniche
a0 = 0;  a1 = 1; 
n = 10; m = 10;  
tol = 0.001;
maxit = 100; 

%handler function
fx = @(x)(exp(x) + sin(4 * pi * x));
cx = @(x)(x); 
soluzione = @(x)(exp(x) + sin(4 * pi * x)); 

%parametri
h = (a1 - a0) / (n + 1); 
x = (1:n)' * h; 
c = (h^2) * (cx(x)); 

%creo matrice del sistema sparsa
A = spdiags([-ones(n,1),  2 * ones(n,1) + c, -ones(n,1)], [-1 0 1], n, n); 
b = h^2 * fx(x); 

y_a0 = 1;           %soluzione in a0
y_a1 = exp(1);      %soluzione in a1
b(1) = b(1) + y_a0; 
b(n) = b(n) + y_a1;

%plot calcolo soluzione attraverso funzione fornita dall'esercizio
xx = linspace(a0, a1, n); 
yy = soluzione(xx); 
plot(xx, yy, 'm'); 
hold on; 

%soluzione teorica
sol = soluzione(x);

%risoluzione sistema mediante metodi iterattivi

%JACOBI
yJ = sparse(n, 1); 
[xJ, kJ] = jacobi(A, b, x, maxit, tol); 
plot([a0; x; a1], [y_a0; yJ; y_a1], 'b*'); % valori calcolati con Jacobi
fprintf('JACOBI\n'); 
fprintf('Numero di iterazioni = %d, ', kJ);
fprintf('norma infinito dell’errore = %g\n\n', norm(yJ - sol, inf));

%GAUSS-SEIDEL
yGS = sparse(n, 1); 
[yGS, kGS] = gaussSeidel(A, b, x, maxit, tol); 
plot([a0; x; a1], [y_a0; yGS; y_a1], 'r+'); % valori calcolati con Jacobi
fprintf('GAUSS SEIDEL\n'); 
fprintf('Numero di iterazioni = %d, ', kGS);
fprintf('norma infinito dell’errore = %g\n\n', norm(yGS - sol, inf));

%SOR
J = speye(n) - spdiags(1 ./ spdiags(A, 0), 0, n, n) * A; %matrice di JACOBI
rhoJ = abs(eigs(J, 1)); %raggio spettrale della matrice di JACOBI 
omega = 2 / (1 + sqrt(1 - rhoJ^2)); %omega ottimo per il metodo SOR
ySOR = sparse(n, 1); 
[ySOR, kSOR] = sor(A, b, x, maxit, tol, omega); 
plot([a0; x; a1], [y_a0; ySOR; y_a1], 'ko'); % valori calcolati con Jacobi
fprintf('SOR\n'); 
fprintf('Numero di iterazioni = %d, ', kSOR);
fprintf('norma infinito dell’errore = %g\n\n', norm(ySOR - sol, inf));

legend({'Soluzione teorica', 'metodo di Jacobi',...
'metodo di Gauss-Seidel', 'metodo SOR'}, ...
'Location','best');
hold off
title('Momento flettente di una trave sollecitata')