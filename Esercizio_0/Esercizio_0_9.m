x = [1:1:70]'; 
A = repmat(x, 70); 
B = repmat(x, 70); 
v = repmat(x, 70); 


clock = tic; 
A*B*v
valueClock = toc(clock)