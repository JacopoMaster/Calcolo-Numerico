function [xi] = ascisseChobyschev(a,b,n)
%   [xi] = ascisseChobyschev(a,b,n)
%   calcola le  ascisse di chobyshev per il polinomio di interpolazione di
%   grado n su un generico intervallo [a b]. 
if a >= b || n~=fix(n) || n<0 
    error("dati errati")
end
xi = (a+b)/2 + (b-a)/2 * cos((2*(0:n)+1) * (pi/(2*n+2)));
end

