n = 5; %input("\nDetermina la lunghezza della matrice: n=");

A=repmat([1:1:5]', 1, n); 

%vettorizzazione
v = A(:); 

V = v.^2; 

B = reshape(V, n, n); 

is_equal = isequal(B,A.^2); 

if is_equal == 1
    disp("Le due matrici sono uguali"); 
else
    disp("Le due matrici sono diverse"); 
end