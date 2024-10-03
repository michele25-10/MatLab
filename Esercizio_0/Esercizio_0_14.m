n = 5;

A = randi([-10, 10], n); 

d = zeros(n); 
for i=1:n
    d(i, i) = A(i, i); 
end
disp(d); 

B = triu(A); 

B = B - d; 

C = B + B'; 

v = [1:5]'; 
val = v'*C*v; 
if val > 0
    fprintf("\nIl valore è maggiore di 0\n"); 
else 
    fprintf("\nIl valore è negativo\n"); 
end

D = [A(:, 1:3) A(n-1:n, :)'];
E = D'*D; 

val = v'*E*v; 
if val > 0
    fprintf("\nIl valore è maggiore di 0\n"); 
else 
    fprintf("\nIl valore è negativo\n"); 
end

is_equal= isequal(E, E'); 
if is_equal == 1
    fprintf("\nE è simmetrica\n")
else
    fprintf("\nE NON è simmetrica\n")
end