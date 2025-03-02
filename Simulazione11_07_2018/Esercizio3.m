%Michele Gabrieli
%MAT

A = [1 0 -1 0; 0 3 0 1; 1 0 2 0; 0 1 0 2]; 
b = [0 -1 0 -1]'; 

[Q, R] = qr(A); 
xQR = solupper(R, solower(Q' * b)); 

[L, U, P] = lu(A);
xLU = solupper(U, solower(L, P * b)); 


