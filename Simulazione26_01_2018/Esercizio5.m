%Michele Gabrieli
%MAt

f = @(x)(1/3 .* exp(-7 .* (x - 3) .* (x - 3)) ); 
a = 1; b = 5; x = linspace(a, b, 201)'; 

y = f(x); 

figure(1); 
plot(x, y, "-b"); 
xlim([a b]);
xlabel("punti equispaziati"); 
ylabel("f(x) e Pn(x)"); 
hold on; 

for n = 1:15
    xx = linspace(a, b, n+1)'; 
    yy = f(xx); 
    [p, coeff] = polyLagrange(xx, yy, x); 

    plot(x, p, "-r", ...
        xx, zeros(1, n+1), "ok", ...
        xx, yy, "or"); 
    title(sprintf("Numero gradi N=%d", n)); 
    
    pause(2); 
end

hold off; 





