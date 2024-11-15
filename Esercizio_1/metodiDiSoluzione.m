%Esercitazione 15-11-2024
%Sistema lineare del circuito elettrico
%
% 1) soluzione con operatore predefinito "\" di matlab
% 2) fattorizzazione LDU con piv. parziale e funzionale predefinita di
% Matlab
%3) fatt. di Gauss con pivoting totale (gaussPivTot.m)
%4) Approccio di memorizzazione sparsa e m. di jacobi

%1. soluzione con operatore predefinito "\" di matlab

B = [[0, -2, -2, -1, -2, -1];
     [11, 13, 3, 3, 11, 9];
     [-2, -2, -1, -4, -1, 0]]';
A = spdiags(B, [1,0,-1], 6, 6);
A(1,6)= -6; 
A(2,5)= -9; 
A(5,2)= -6; 
A(6,1)= -4; 

Afull = full(A)
bfull = [120; zeros(5,1)];
b = sparse(bfull); 
[mA, nA] = size(Afull);

%1. con operatore predefinito
x1 = A \ b; 


%2. LDU pivoting parziale
[Lpar, Rpar, ppar] = lu(Afull, 'vector');        %[Lpar, Rpar, ppar] = lu(A)
x2 = utrisol2(Rpar, ltrisol(Lpar, bfull(ppar)));  %x2 = utrisol(Rpar, ltrisol(Lpar, Ppar*b)); 

%3. LDU pivoting totale
[Ltot, Rtot, ptot, qtot] = gaussPivTot(Afull);
x3 = utrisol2(Rtot, ltrisol(Ltot, bfull(ptot))); 
Q = eye(mA); 
Q = Q(:, qtot);
x3 = Q*x3; 

%4. metodo di Jacobi
d = diag(A);
if(any(~d)), error("Diagonale principale di A con elementi nulli"); end
cJ = b ./ d; I = speye(mA); 
tolx = 1.0E-5; maxiter = 100; x4= sparse(mA, 1); stop = 0; k = 0; 
while(~stop)
    k = k+1;
    xold=x4;
    x4 = x4 - (A * x4 - b) ./ d; 
    stop = (norm(x4 - xold, "inf") < tolx || (k == maxiter));
end