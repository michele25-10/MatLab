clear all; 

f= @(x) (atan(0.7 .* x - 2)); 
fp = @(x) (0.7./(1 + ((0.7 .* x) - 2)^2))


xx = [-0.9; 5.5]
yy = f(xx)

x0 = 5; 
x1 = x0 - (f(x0) / fp(x0));
%disp(f(x0) / fp(x0))
x2 = x1 - (f(x1) / fp(x1)) ; 
disp((f(x1) / fp(x1))) ;

x3 = x2 - (f(x2) / fp(x2)); 
disp(f(x2) / fp(x2)) ;

x0 = 0; 
x1 = 2; 
x2 = x1 - (f(x1)/(f(x1) - f(x0)))*(x1 - x0); 
disp((f(x1)/(f(x1) - f(x0)))*(x1 - x0)); 
x4 = x2 - (f(x2)/(f(x2) - f(x1)))*(x2 - x1); 
disp((f(x2)/(f(x2) - f(x1)))*(x2 - x1)); 