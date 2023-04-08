function [y] = newtonInterpolante(x,f,xx)
%   esercizio 19: [y] = newtonInterpolante(x,fun,xx)
%                       Input: x-> vettore contenente le ascisse xi
%                              f -> valore della funzione nei vari punti
%                              xi
%                              xx -> vettore su cui calcolare il valore del
%                              polinomio.
%                       Output -> valore/valori del polinomio calcolati sui
%                       punti xx.
n = length(x)-1;
if nargin <3 || length(x)<1
    error("Input non validi");
end
if length(f)~=length(x)
    error("numero di fi calcolati non corrisponde col numero di ascisse, errore");
end
for i = 1:length(x)-1
    for j = i+1:length(x)
        if (x(i) == x(j))
           error("Ascisse uguali rilevate"); 
        end
    end
end
for j = 1:n
    for i = n+1:-1:j+1
        f(i) = (f(i)-f(i-1))/(x(i)-x(i-j));
    end
end
n = length(x);
c = f;
y = c(n)*ones(size(xx));
for i = n-1:-1:1
    y = y.*(xx-x(i))+c(i);
end
return
end

