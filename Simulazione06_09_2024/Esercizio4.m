%Michele Gabrieli
%MAT

close all; clear all; clc; 

M = [-3 -1/5 0; -0.5 4 1/6; 0 -1/3 -2]; 
z = [-2/3; pi/4; -5/2]; 

Dinv = eye(3, 3) ./ diag(M, 0); 
D = eye(3, 3) .* diag(M, 0);
L = -tril(M, -1); U = -triu(M, 1); 

J = Dinv * (U + L); 
cJ = Dinv * z; 

G = inv(D - L) * (U); 
cG = inv(D - L) * z; 


xOldJ = [-2 1 -3]'; xOldG = xOldJ;
for k=1:5
    xJ = J * xOldJ + cJ; 
    xG = G * xOldG + cG;

    xOldJ = xJ; xOldG = xG; 
end

disp(xOldJ); disp(xOldG);

xSolGPP = M \ z 

diffGJ = abs(xOldJ -xOldG)



