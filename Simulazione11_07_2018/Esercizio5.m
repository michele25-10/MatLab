%Michele Gabrieli   
%MAT

g = @(x)(exp(-x./2)); 
a = 0; b = 2; 

xx = linspace(a, b, 401)'; yy = g(xx); 

n = 10; 
xCheb = (b - a)/2 .* cosd(((2 .* (1:n) + 1) .* 180)./(2 * (n+1))) + (a + b)/2; 
yCheb = g(xCheb); 

pp = tabDiff(xCheb, yCheb); 
y = polyval(pp, xx); 
figure(1) 
plot(xx, yy, "-b", xx, y, "-r");
xlabel("x"); ylabel("y"); 

errRel = abs(yy - y) ./ yy; 

figure(2)
plot(xx, errRel, "-k"); 
