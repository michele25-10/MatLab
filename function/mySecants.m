function [x1, f1, iter, varargout] = mySecants(x0, x1, fx, tolX, tolF, limit)
%mySecants Risolve una eq. non lineare mediante il metodo delle secanti
%   Detailed explanation goes here

%Controlli sugli input
%x0 ~ x1 numerici....
%tolX, tolF reali positivi
%verificare se fx è una function handle

%history = x; 
iter = 0; 
f0 = feval(fx, x0); f1 = feval(fx, x1); told = 1.0E-12; 
stop = ((abs(x1 - x0) < tolX) && (abs(f1) < tolF)) && iter > limit; 

if(nargout > 3),  x =  zeros(limit+2, 1); x(1:2) = [x0; x1];  end

while ~stop
    d = f0 / f1; 
    %if((1 - d) < told), error("Valori di f eccessivamente simili"); end
    iter = iter + 1;
    step = x1 - x0; x0 = x1; f0 = f1; 
    x = x1 - (1 / (1 -d)) * step;   
    f1 = feval(fx, x); 
    
    stop = ((abs(x1 - x0) < tolX) && (abs(f1) < tolF)) && iter > limit; 
    
    if(nargout > 3), x(iter + 2) = x1; end
end

 if(nargout > 3), varargout{1} = x(1 : (iter + 2)); end

end

