close all; clear all; clc; 



a = -1; b = 1; n = 1; g = @(x)(exp(-x)); 

tj = cos(((2 * (n:-1:0) + 1)./(2 * (n+1))).*pi)'
x = ((b-a)/2) .* tj + ((b+a)/2)
y = g(x)
polyfit(x, y, n)
