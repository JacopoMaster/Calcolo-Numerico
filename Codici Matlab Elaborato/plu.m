function [LU,p] = plu(A)
%ESERCIZIO9
% [LU,p] = plu(A) [INPUT]
%                 A => Matrice quadrata non singolare tale che A è fattorizzabile LU.
%                 [OUTPUT]
%                 LU => matrice che contiene sia le informazioni della triangolare inferiore che della triangolare superiore 
%                 p => vettore che contiene l'informazione della matrice di permutazione P.
%                 
%                 Restituisce errore se viene fornita una matrice non quadrata e/o non
%                 singolare.
[m,n] = size(A);
if m~=n, error('matrice non quadrata'); end
p = (1:n);
LU = A;
for i=1:n-1
    [mi,ki] = max(abs(LU(i:n,i)));
    ki = ki+i-1; 
    if mi==0
        error("matrice non singolare");
    end
    if ki>i
        LU([i,ki],:) = LU([ki,i],:); 
        p([i,ki]) = p([ki,i]);
    end
    LU(i+1:n,i) = LU(i+1:n,i)/LU(i,i);
    LU(i+1:n,i+1:n) = LU(i+1:n,i+1:n)-LU(i+1:n,i)*LU(i,i+1:n);
end
end

