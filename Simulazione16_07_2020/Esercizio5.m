%MIchele Gabrieli
%MAT

close all; clear all; clc; 
n = 30; 
rng(4); 

ro = 1.5; beta = 4; gamma = 1.8; 
a = -2; b = 4; 
myDelta = (2* rand ( n+1 ,1) - 1) * ro / 4;
f = @(x)((ro .* sin(beta .* x + gamma)) + myDelta );
x = a + (b - a) .* rand(n+1, 1);
disp(x); 
y = f(x); 
disp(y);

A = ones(n+1, n+1);

%A * A' * x = A' * b
A(:, 1:n) = x.^(n:-1:1); 
disp(A*A'); disp(A' * y); 
z = (A*A') \ (A'*y); 
sol2 = A \ y; 

xx = linspace(a, b, 401); 
yy = polyval(sol2, xx); 

figure(1); 
plot(x, f(xx) , "ob", xx, yy, "-r"); 
xlim([a, b]); 





