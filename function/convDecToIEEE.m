function [ieee, varargout] = convDecToIEEE(alpha, varargin)
%convDecToIEEE -> Conversione di un numero decimale allo standard IEEE
%   Algoritmo delle divisioni successive
% SYNOPSIS: [ieee [, components]] = convDecToBase_int(alpha [, type, verbose]); 
% INPUT: alpha (double) - numero da convertire,
%        type (integer, optional) - 32 o 64 valori possibili
%        verbose (integer, optional) - scrivere risultati intermedi
% OUTPUT: ieee (string) - mandatory, result operation
%         components (string Matrice 1x3, optional) - segno, esponente,
%         mantissa

if(~isnumeric(alpha)) 
    error("Alpha deve essere un valore numerico"); 
end

verb=0; 
type=32; 
if(nargin > 1)
    if(varargin{1} == 64 || varargin{1} == 32)
        if(~isempty(varargin{1}))
            type=varargin{1};
        end
    else
        error("Il type può essere o IEEE-32 o IEEE-64"); 
    end
    if(nargin > 2)
        verb=varargin{2}; 
    end
end

sign = '0'; 
if(alpha < 0)
    sign ='1'; 
end
alpha=abs(alpha); 
if(verb > 0)
    fprintf("\nconvDecToIEEE: Il segno è: %s", sign)
end

%se type è 32 allora valori di default
dim_esp=8; 
dim_mant=23; 
bias=127; 
if(type == 64)
    dim_esp=11; 
    dim_mant=52; 
    bias=1023; 
end
if(verb > 1)
    fprintf("\nconvDecToIEEE: %s %d, %s %d, %s %d", ...
        "Dim Esponente", dim_esp, ...
        "Dim mantissa", dim_mant, ...
        "Valore Bias", bias); 
end

if(verb > 0)
    fprintf("\nconvDecToIEEE: Sto eseguendo la conversione da DEC a BINARY"); 
end
int=fix(alpha); 
if(int >= 1)
    [intConv] = convDecToBase_int(int, 2); 
    intConv = num2str(intConv); 
end
frac=alpha-int; 
[fracConv] = convDecToBase_frac(frac, 2, dim_mant); 
fracConv=num2str(fracConv); 

if (int >= 1)
    int_length=strlength(intConv); 
    p_pos = int_length - 1; 
    p = bias + p_pos; 
else
    disp(fracConv); 
    exit = false; 
    i = 3; 
    while (~exit)
        if(fracConv(i) == '1')
            exit = true; 
        else
        i = i + 1; 
        end
    end
    p_pos = i - 2; 
    p = bias - p_pos; 
    disp(p); 
end
[esponente] = convDecToBase_int(p, 2);
esp_length = strlength(esponente); 

if(esp_length < dim_esp)
    n_zeros = dim_esp - esp_length;  
    zeros = repmat('0', 1, n_zeros); 
    esponente = strcat(zeros, esponente); 
end

if(int >= 1)
    mantissa = strcat(intConv(2:end), fracConv(3:end)); 
else
    mantissa = fracConv((p_pos+2):end); 
    mant_length = strlength(mantissa); 
    if (mant_length < dim_mant)
        n_zeros = dim_mant - mant_length; 
        zeros = repmat('0', 1, n_zeros); 
        mantissa = strcat(mantissa, zeros); 
    end
end
ieee = strcat(sign, esponente, mantissa(1:dim_mant)); 
if(verb > 0)
    fprintf("\nconvDecToIEEE: %s %s, %s %s, %s %s", ...
                "Segno", sign, ...
                "Esponente", esponente,  ...
                "Mantissa", mantissa(1:dim_mant)); 
end

if(nargout > 1)
    varargout{1} = [sign, esponente, mantissa(1:dim_mant)]; 
end

end

