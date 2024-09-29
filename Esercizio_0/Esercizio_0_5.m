v = [1:5]'; 
A = [v v v v v]; 

v = A(2, :); 
w = A(:, 3); 

B = A([3:5], [3:5]); 

tmp = [1 0 0 0 0 0 1]'; 
one = repmat(1, 5, 1)'; 
A = [tmp [one; A; one] tmp]; 

