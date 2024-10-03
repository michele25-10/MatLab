x = [1:1:70]'; 
A = repmat(x, 1, 70)
B = repmat(x, 1, 70); 
v = repmat(x, 1, 70); 


clock = tic; 
A*B*v
valueClock = toc(clock)