%Michele Gabrieli
%MAT

A = [9 -3 -1; -2 9 0; -2 0 9]; 

D = eye(3, 3) .* diag(A); 
Dinv = eye(3, 3) ./ diag(A); 
U = triu(A, 1); 
L = - tril(A, -1); 

J = Dinv * (L + U); 
DmenoLinv = inv(D - L); 
GS = DmenoLinv * U; 

disp(J); 
disp(GS); 

%CALCOLO RAGGIO SPETTRALE
Vj = eig(J); 
Vgs = eig(GS);
spectrJ = max(abs(Vj)); 
spectrGS = max(abs(Vgs)); 

fprintf("\n\nRaggio spect. Jacobi: %g", spectrJ); 
fprintf("\nRaggio spettrale Gauss Seidel: %g", spectrGS); 

%Ax = b
b = [5 -2 3]';
tol = 1.0e-5; maxit = 100; x = 0; 

[sol, k] = jacobi(A, b, x, maxit, tol); 

fprintf("\n\nJACOBI: %g\n", k); disp(sol);


%CALCOLO RISULTATI TRAMITE GAUSS-SEIDEL
i = 0; 
stop = false;
x = [0 0 0]'; 
while ~stop
        i = i + 1;
        xTemp = x;
        x = GS .* xTemp + DmenoLinv .* b; 
        
        % Controllo della condizione di arresto
        stop = (norm(xTemp - x, inf) < tol * norm(x, inf)) || (i == maxit);
 end

fprintf("\n\nGAUSS-SEIDEL k: %g\n", i); disp(x); 
