%Michele Gabrieli
%MAt

close all; clear all; clc; 

a = 0.1; b = 2.7; 

f = @(x) (-log(2.*x)); 
x = [0.1 0.4 1.1 1.5]'; 
y = f(x); 


d3 = tabDiff(x, y); 



p3check = polyfit(x, y, 4); 
dips(p3check); 

x(5) = 0.9; y(5) = f(x(5)); 
p4 = tabDiff(x, y);

x(6) = 2.7; y(6) = f(x(6)); 
p5 = tabDiff(x, y); 

xx = linspace(a, b, 401)'; 
yy = f(xx); 

figure(1)
plot(xx, yy, "-r", xx, polyval(p3, xx), "-k", ...
    xx, polyval(p4, xx), "-b", ...
    xx, polyval(p5, xx), "-v"); 
xlim([0, 3]); 

