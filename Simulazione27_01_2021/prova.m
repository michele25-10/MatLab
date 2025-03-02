clear all; 
A = [3 0.5 0; 0.25 5/3 0.5; 0 1/3 1]; 

Dinv = eye(3, 3) ./ diag(A) ;
U = -triu(A, 1);
L = -tril(A, -1); 

J = Dinv * (U + L); 
disp(J); 

D = eye(3, 3) .* diag(A); 

GS = inv(D - L) * U; 
disp(D-L); 
disp(GS)