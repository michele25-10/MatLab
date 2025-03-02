%Michele Gabrieli
%MAT
a = 2.7; b = 4;  
maxit = 10; x0 = 2.8; tolx = 10^(-5); tolf = 10^(-7); trace=-1; 
fname = @(x)(tand(1 - x) - (2/3)); 
fpname = @(x)(1/(cosd(1-x) * cosd(1-x)));

[x, it, xk, fk] = myNewton(fname, fpname, x0, tolx, tolf, maxit, trace); 

xx = linspace(a, b, 401); 

figure(1)
plot(xx, fname(xx), "-b"); 
xlabel("approssimazione x"); 
ylabel("value function"); 
yline(0, "-k"); 
hold on; 

plot(xk, fk, "or"); 

hold off; 









