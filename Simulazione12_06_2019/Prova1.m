A = [3 -2 1 0; -6 4 2.5 0; 1 2.5 -6 1; 0 0 1 4]; 
b = [0 2 -6 0]'; 

A = spdiags([sotDiag diagonale sotDiag], [-1; 0;  1], n, n); 
b = repmat(2, n, 1); b([1, n]) = 3; 


L = -tril(A, -1);
U = -triu(A, 1); 
Dinv = speye(n, n) ./ diagonale; 
D = speye(n, n) .* diagonale; 

omega = 5/4; 

first = inv(D - omega .* L); 
second = (1 - omega) .* D + omega .* U;  