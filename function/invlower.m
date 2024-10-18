function [R] = invlower(R)
%INVLOWER Summary of this function goes here
%   Da finire nel weekend

[m, n] = size(R); 
if(~isempty(find(diag(R) == 0)))
    R(n,n) = 1/R(n, n); 
end
end

