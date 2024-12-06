    function [coeffs1, coeffs2] = olsByNormEq(x, y, degree, varargin)
    %OLSBYNORMEQ Solves the OLS algebraic polynomial problem by normal
    %           equations
    %   Detailed explanation goes here
    
    x = x(:); y = y(:); 
    n = numel(x); 
    
    if(n ~= numel(y)), error("Errore lunghezza"), end
    
    if(nargin > 3)
        if(~isempty(varargin{1})), w = varargin{1}, w=w(:), end
    end
    
    A = [x .^ (degree:-1:2), x, ones(size(x))];
    
    %Alternativa per la costruzione di A con meno operazioni ma meno compatta
    %
    %A = zeros(numel(x), degree + 1 ); 
    %A(:, degree-1) = x; 
    %for k = degree : -1 :  2
    %    A(:, k-1) = A(:, k) .* x; 
    %end
    
    %controllare il rango di A
    
    if(nargin > 3)
        %caso in cui mi venga passato anche i pesi
        B = A' * diag(w) * A; 
        d = sqrt(w) .* y; 
    else 
        B = A' * A; 
        d = A' * y; 
    end
    [L, flag] = chol(B, 'lower'); 
    
    %in questo caso non si può procedere in questo modo
    if(flag), error("Matrice A non di rango massimo"), end
    
    coeffs1 = utrisol2(L', ltrisol(L, d)); 
    
    if(nargout > 1)
         [Q, R] = qr(A); 
         d = Q(:, 1:degree+1)' * y;
         coeffs2 = utrisol2(R(1:(degree+1)), d); 
    end
    
    % nel caso in cui non avessimo a disposizione funzioni di risoluzione
    % sistemi
    %coeffs = L' \ (L \ d); 
    end

