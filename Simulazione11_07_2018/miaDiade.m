function [ rango , deter , normaInf ] = miaDiade(r,s)
%MIADIADE Summary of this function goes here
%   Detailed explanation goes here

r = r(:); s = s(:);

if(numel(r) == 0), error("Vettore r è vuoto"); end; 
if(numel(s) == 0), error("Vettore s è vuoto"); end

r = r (:) ; s = s (:) ;
A = r *s'; [m , n ] = size ( A ) ;

[Q , R ] = qr( A ) ;

diagonaleR = diag ( R ) ;
normaInf = norm (A , inf ) ;
rango = numel ( find (abs ( diagonaleR ) > eps * normaInf ) ) ;
deter = prod ( diagonaleR ) ;

end

