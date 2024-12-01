function [yy, pp] = polyNewton(x, y, nuoveAscisse)
%POLYNEWTON Summary of this function goes here
%   Detailed explanation goes here
x = x(:);  y= y(:); n=numel(x); 

[fx] = tabDiff(x, y); 
vv = ones(size(nuoveAscisse)); 
yy = fx(1) * vv; 

if(nargout > 1 ), p = 1; pp = y(1); end

for k = 2:n
    vv = vv .* (nuoveAscisse - x(k-1)); 
    yy = yy + fx(k) * vv; 
    if(nargout > 1)
        p = conv(p, [1, -x(k-1)]); 
        pp = [0, pp] + fx(k) * p; 
    end
end

end

