V = []; 
x = []; 

timerVal = tic; 
for m = 1:1:5
    for n = 1:1:5
        x = [x; n]; 
    end
    V = [V x.^(m-1)]
    x = []; 
end

elapsedTime = toc(timerVal)

