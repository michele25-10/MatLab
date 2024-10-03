jumper = 360 / 20; 
x = [0:jumper:360]'; 

y = sin(x); 
z = cos(x); 
fprintf("\n%-5s %-5s %-5s\n", "Grade", "Seno", "Cos")
fprintf("%-5s %-5s %-5s\n", "-----", "-----", "-----")

for i = 1:20
    fprintf('%-5d %-5d %-5d\n', x(i), y(i), z(i));
end