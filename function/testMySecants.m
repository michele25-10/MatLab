f = @(x)( x.^ 2 - 2 ); 
x0 = 1.0; 
x1 = 2.0; 
maxiter = 100; 
tolX = 1.0E-8; 
tolF = tolX; 


xs = mySecants(x0, x1, f, tolX, tolF, maxiter);  
disp(xs); 


g = @(x)( cos(2*x) .* sin(2 * x) ); 
x0 = 0.5; x1 = 1; 
[xs, fxs, iter, xiter] = mySecants(x0, x1, g, tolX, tolF, maxiter)