function [x] = solveLU(A,b)
% usa la fattorizzazione LU per risolvere il sistama A*x=b
[m,n] = size(A);
for i = 1:n-1
    if A(i,i)==0
        error("Matrice non fattorizzabile LU");
    end
    A(i+1:n,i) = A(i+1:n,i)/A(i,i);
    A(i+1:n,i+1:n) = A(i+1:n,i+1:n)-A(i+1:n,i)*A(i,i+1:n);
end
LU = A;
n = length(b);
x = b;
for i = 1:n-1
    x(i+1:n) = x(i+1:n)-LU(i+1:n,i);
end
for i=n:-1:1
    x(i) = x(i)/LU(i,i);
    x(1:i-1) = x(1:i-1)-x(i)*LU(1:i-1,i);
end
return
end

