function [y] = hermiteInterpolante(x,f,xx)
%   esercizio 20: [y] = hermiteInterpolante(x,f,xx)
%                       Input: x-> vettore contenente le ascisse xi del
%                       tipo [x0 x0 x1 x1 etc..]
%                       f -> valore della funzione nei vari punti
%                       e della derivata: [f(x0) f'(x0) f(x1) f'(x1) etc..]
%                       xx -> vettore su cui calcolare il valore del
%                       polinomio.
%                       Output -> valore/valori del polinomio calcolati sui
%                       punti xx.
if nargin <3 || length(x)<1 || length(f)~=length(x)
    error("Input non validi");
end
n = (length(x)/2)-1;
for i = (2*n+1):-2:3
        f(i) = (f(i)-f(i-2))/(x(i)-x(i-1));
end
for j = 2:2*n+1
    for i = (2*n+2):-1:j+1
        f(i) = (f(i)-f(i-1))/(x(i)-x(i-j));
    end 
end
n = length(x);
c = f;
y = c(n)*ones(size(xx));
for i = n-1:-1:1
    y = y.*(xx-x(i))+c(i);
end
end

