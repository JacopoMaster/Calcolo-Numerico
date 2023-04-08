function [z] = lagrangeInterpolante(x,f,xx)
%   esercizio 19: [z] = lagrangeInterpolante(x,f,xx)
%                       Input: x-> vettore contenente le ascisse xi
%                              f -> valore della funzione nei vari punti
%                              xi
%                              xx -> vettore su cui calcolare il valore del
%                              polinomio.
%                       Output -> valore/valori del polinomio calcolati sui
%                       punti xx.
%   Calcola le differenze divise e utilizza l'algoritmo di Horner per il
%   calcolo del polinomio interpolante.
n=length(x);
cin = ones(n,size(xx,2));
if nargin <3 || length(x)<1 || length(f)~=length(x)
    error("Input non validi");
end
for i = 1:length(x)-1
    for j = i+1:length(x)
        if (x(i) == x(j))
           error("Ascisse uguali rilevate"); 
        end
    end
end
for i = 1:n
    if (f(i) ~= 0)  % grazie a questo controllo risparmio in totale k*z*n iterazioni,
                    % dove k indica il numero di occorrenze degli elementi 
                    % nulli nel vettore fi e z gli elementi di xx.
        for j=1:n
            if (j~=i)
                cin(i,:) = cin(i,:).*(xx-x(j))/(x(i)-x(j));
            end
        end
    end
end
z = 0;
for i=1:n
    z=z+f(i)*cin(i,:);
end
return
end

