function [points] = lagrangeHermiteInterpolante(x,f,xx)
%   esercizio 20: [z] = lagrangeHermiteInterpolante(x,f,xx)
%                       Input: x-> vettore contenente le ascisse xi nel
%                       formato duplicato [f(x0) f(x0) f(x1) f(x1) ... ]
%                              f -> valore della funzione nei vari punti
%                              nel formato [f(x0) f'(xo) f(x1) f'(x1) ...]
%                              xx -> vettore su cui calcolare il valore del
%                              polinomio.
%                       Output -> valore/valori del polinomio calcolati sui
%                       punti xx.
if nargin <3 || length(x)<1 || length(f)~=length(x)
    error("Input non validi");
end
ff = f(1:2:end);
ff1 = f(2:2:end);
x = x(1:2:end);
n=length(x);
points = zeros(size(xx));
for i = 1:n
    tempx = x;
    ci = tempx(i);
    tempx(i) = [];
    cin = ones(size(xx));
    for j = 1:length(tempx)
        cin = cin.*(xx-tempx(j));
    end
    denominatore = prod(ci-tempx);
    cin = cin/denominatore;
    cin1 = 0;
    for j = 1:length(tempx)
        cin1 = cin1+prod(ci - tempx([1:j-1 j+1:end]));
     end
    cin1 = cin1/denominatore;
    cinquad = cin.^2;
    points = points + ff(i)*cinquad.*(1-2*cin1*(xx-x(i)))+ff1(i)*cinquad.*(xx-x(i));
end
return
end
