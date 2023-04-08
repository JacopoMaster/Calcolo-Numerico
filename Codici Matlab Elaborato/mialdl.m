function [x] = mialdl(A,b)
%   [INPUT]
%   A => matrice sdp fornita in input.Nel codice mano mano si verifica
%   anche che la matrice sia effettivamente sdp o meno.
%   b => vettore delle soluzioni 
%   La funzione ritorna nel vettore x la soluzioni del sistema
%   A*x=b ovvero LDL^T*x=b
[m,n] = size(A);
if m~=n, error('matrice non quadrata'); end
if length(b) ~= n, error('dimensioni errate'); end
if A(1,1)<=0
    error("la matrice fornita non è sdp");
end
A(2:n,1) = A(2:n,1)/A(1,1);
for j=2:n
    v = (A(j,1:j-1).').*diag(A(1:j-1,1:j-1));
    A(j,j) = A(j,j)-A(j,1:j-1)*v;
    if A(j,j)<=0
        error("la matrice non è sdp");
    end
    A(j+1:n,j) = (A(j+1:n,j)-A(j+1:n,1:j-1)*v)/A(j,j);
end
%disp(A);
n=length(b);
y=b;
for i=2:n
    for j=1:i-1
        y(i)=y(i)-A(i,j)*y(j);
    end
end
z=y ./ diag(A);
x=z;
for i=n:-1:1
    for j=1:i-1
        x(j)=x(j)-A(i,j)*x(i); 
    end
end
end

