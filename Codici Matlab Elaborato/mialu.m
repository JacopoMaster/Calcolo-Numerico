function x = mialu(LU,p,b)
% Esercizio 10
%  x = mialu(LU,p,b) [INPUT]
%                    LU => input Matrice fattorizzata LU tramite il codice plu
%                    p => contiene l'informazione della matrice di permutazione P, ottenuta
%                         da plu.m
%                    b => vettori termini noti sistema lineare
%                    [OUTPUT]
%                    x => vettore contenente le soluzioni del sistema A*x=b
%                    Il codice si propone di risolve il sistema di equazioni lineari
%                    LU*x=b dove LU = A ovvero A*x=b
%                    restituisce un errore se la matrice fornita in input è non quadrata e/o la
%                    dimensione della matrice non coincide con la dimensione dei vettori:
%                    permutazione e soluzione.
[m,n] = size(LU);
if m~=n, error('matrice non quadrata'); end
if length(p) ~= n || length(b) ~= n, error('dimensioni errate'); end
x = b(p);
for i=1:n-1
    x(i+1:n) = x(i+1:n) - LU(i+1:n,i)*x(i); 
end
x(n) = x(n)/LU(n,n);
for i=n-1:-1:1
    x(1:i) = x(1:i)-LU(1:i,i+1)*x(i+1);
    x(i) = x(i)/LU(i,i);
end
return 
end  