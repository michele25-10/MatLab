v = randn(25); 
w = randn(25); 
s = [1:25]'; 

t = (v.*w)*v + (v.*w)*w; 

p = t./s; 

A = randn(3, 25); 
q = A*p; 

e1 = [1; 0; 0];
e2 = [0; 1; 0];
e3 = [0; 0; 1];
I = [e1 e2 e3];

a_1 = q.*e1;
a_2 = q.*e2;
a_3 = q.*e3;

a = [a_1 a_2 a_3]'; 

if isequal(a, q)
    fprintf("a è uguale a q"); 
else
   fprintf("a è diversa da q"); 
end

b = fix(a(1:2:end) * 10);

c = [1:3]';

B = [q; q; q]; 

