%Michele Gabrieli  
%Mat

A = [1 3 -1; 1 2 0.5; 5 10 -1]; 
b = [-2 0.5 -1]';

[L, R, p, deter] = gauss2(A); 

y1 = sollower(L, b(p)); 
x1 = solupper(R, y1); 
disp(x1); 


%sol = solupper(R, b)'
