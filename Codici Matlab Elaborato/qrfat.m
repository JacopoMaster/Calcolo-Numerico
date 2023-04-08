function [QR] = qrfat(A)
% [QR] = qrfat(A) Metodo per ottenere la fattorizzazione QR
%                    di una matrice A avente come caratteristica
%                    m>=n, con m numero di righe e n numero di colonne.
%                    Restituisce error se non è vero che m>=n oppure
%                    durante la computazione viene verificato che la
%                    matrice non abbia rango massimo.
[m,n] = size(A);
if m<n, error('matrice non valida, m>=n necessario'); end
for i=1:n
   alfa=norm(A(i:m,i));
   if alfa==0
       error("la matrice non ha rango max");
   end
   if A(i,i)>=0 
       alfa = -alfa;
   end
   v1 = A(i,i)-alfa;
   A(i,i) = alfa;
   A(i+1:m,i) = A(i+1:m,i)/v1;
   beta = -v1/alfa;
   A(i:m,i+1:n)=A(i:m,i+1:n)-(beta*[1;A(i+1:m,i)])*([1 A(i+1:m,i)']*A(i:m,i+1:n));
end
QR=A;
end

