function [x] = miaqr(A,b)
% [x,r] = miaqr(A,b) Metodo per risolvere il sistema Ax=b
%                    dove A è una matrice di tipo QR ottenuta, ad esempio,
%                    dalla function qrfat.m
%                    Condizione necessaria: m>=n, con m numero di righe e 
%                    n numero di colonne.
%                    Restituisce error se la matrice QR presenta uno 0 lungo
%                    la diagonale.
%                    Ritorna x vettore soluzione.
[m,n] = size(A);
if m<n, error('matrice non valida, m>=n necessario'); end
QR = A;
x = b;
for i = 1:n
    v = [1;QR(i+1:m,i)];
    beta = -2/(norm(v)^2);
    x(i:m) = x(i:m) + (beta*(v'*x(i:m)))*v;
end
for i=n:-1:1     
    if QR(i,i) == 0, error ("matrice non valida"); end
    x(i) = x(i)/QR(i,i);
    x(1:i-1) = x(1:i-1)-x(i)*QR(1:i-1,i);
end
return
end

