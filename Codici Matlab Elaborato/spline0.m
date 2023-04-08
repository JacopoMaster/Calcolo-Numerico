function [yy] = spline0(x,f,xx)
% % esercizio 22: calcola la spline cubica naturale interpolante la
% funzione.
% [yy] = spline0(x,f,xx)
%               Input=> x: vettore delle ascisse già ordinato
%                       f: vettore contenente il valore della funzione sulle
%                       ascisse
%                       xx: punti in cui calcolare la spline interpolante.
%               Output=> yy: punti interpolatori da passare insieme alle
%               ascisse in modo tale da essere plottati.
% Esempio di utilizzo della function:
% a = 0;  b = 1;
% N = 5;
% x = linspace(a,b,N);  %%% x ha dimensione N
% f = cos(x);
% xx = a:0.05:b;
% yy = spline0(x,f,xx);
% plot(x,f,'o',xx,yy)

if ~issorted(x) || length(x)~=length(f)
    error("Input non validi");
end
y =f;
N = length(x);
n = N-1;
deltax = (x(end)-x(1))/n;
%%% definizione matrice A
A = zeros(n-1,n-1);
h = diff(x);

for i=1:n-1
    for j=1:n-1
        if i==j
            A(i,j) = 2; %%*(2*deltax);
        elseif j == i+1
            A(i,j) = h(i)/(h(i)+h(i+1));%%1/2; %%deltax; %%1/2;
        elseif j == i-1
            A(i,j) = h(i+1)/(h(i)+h(i+1));%%1/2; %%deltax; %%1/2;
        end
    end
end
%%% definizione vettore b
b = zeros(n-1,1);
for i = 1:n-1
    b(i) = 6*(  ((y(i+2)-y(i+1))/(x(i+2)-x(i+1))) - ((y(i+1)-y(i))/(x(i+1)-x(i))) )/(x(i+2)-x(i));   
end

%%% trovo m
m = A\b; %%OPPURE TRAMITE FATTORIZZAZIONE LU: m = solveLU(A,b);
m = [0;m;0];

for i = 1:n
    r(i) = (m(i) - m(i+1))*deltax/6 - (y(i) - y(i+1))/deltax;
    q(i) = -m(i+1)/6*deltax^2 + y(i+1);
end

%%% definizione s(x) a pezzi
s = zeros(n,N);
for i = 1:n
    s(i,:) = (m(i+1)*(x-x(i)).^3 + m(i)*(x(i+1)-x).^3)/(6*deltax) + q(i)*(x-x(i)) + r(i);
end

xx3 = []; xx1 = []; xx2 = []; yy = [];
for i = 1:n
    vv = pwch(x,y,s(i,:));
    xx3 = xx(xx<=x(i+1)); 
    xx2 = [xx2,xx1]; 
    xx1 = setdiff(xx3,xx2);
    yy1 = ppval(vv,xx1);
    yy = [yy,yy1];
end

return
end