%Michele Gabrieli
%Mat

A = [2 0 -0.5 -0.5; 0 2 -1 -1; -0.5 -1 2 0; -0.5 -1 0 2]; 
b = [1 -1 -1 1]'; 

U = -triu(A, 1); 
L = -tril(A, -1); 

tmp = diag(A); 

D = eye(4, 4) .* tmp; 
Dinv = eye(4) ./ tmp;

tmp=[]; 

%JACOBI
J = Dinv * (L + U); 
autovalori = eig(J); 
rSpect = max(abs(autovalori)); 
velA = floor(-log(rSpect)); 
format rat
fprintf("\n\nJACOBI --> raggio spettrale: %g;\nVelocità asintotica: %g\nMatrice:\n", ...
    rSpect, velA); 
disp(J); 

%seidel
DmenoL = D - L; 
DmenoLinv = inv(DmenoL); 
G = DmenoLinv * U; 
autovalori = eig(G); 
rSpect = max(abs(autovalori)); 
velA = floor(-log(rSpect));
fprintf("\n\nGAUSS-SEIDEL --> raggio spettrale: %g;\nVelocità asintotica: %g\nMatrice:\n", ...
    rSpect, velA); 
disp(G); 

it = 6; 

%6 iterazioni Jacobi e Gauss-Seidel
xJ = zeros(4, it); xG = xJ; xSOR = xJ;  
for k = 2: 1: it
    xJ(:, k) = J * xJ(:, k-1) + Dinv * b; 
    xG(:, k) = G * xG(:, k-1) + DmenoLinv * b; 
end
fprintf("\n\n6 iterazioni con JACOBI:\n" )
disp(xJ); 
fprintf("\n\n6 iterazioni con GAUSS-SEIDEL:\n" )
disp(xG); 

%iterazioni SOR
[xSOR, k] = sor(A, b, [0 0 0 0]', it, 10e-4, 1.5);
fprintf("\n\n\nSOL: %v\niterazioni: %g\n", xSOR, k); 

%iterazioni SOR totali
[xStar, k] = sor(A, b, [0 0 0 0]', 100, 10e-5, 1.2);
fprintf("\n\n\nSOL: %v\niterazioni: %g\n", xStar, k); 

rJ = abs(xJ(:, it) - xStar) ./ xStar; 
rG = abs(xG(:, it) - xStar) ./ xStar; 
rSOR = abs(xSOR - xStar) ./ xStar; 

figure(1)
plot(xJ, rJ, "-b", xG, rG, "-k", xSOR, rSOR, "-r"); 
yscale("log"); 
xlabel("Soluzioni di tipo x"); 
yLabel("Residuo"); 

