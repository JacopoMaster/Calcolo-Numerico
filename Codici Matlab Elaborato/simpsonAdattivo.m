function [I2,np] = simpsonAdattivo(f,a,b,tol,fa,f1,fb)
%   esercizio 29 [I2,np] = simpsonAdattivo(f,a,b,tol,fa,f1,fb)
%   f => funzione su cui effettuare l'approssimazione.
%   a,b => estremi intervallo di integrazione
%   %tol => tolleranza passata
%   ignorare gli ultimi 3 input: vengono usati dalle chiamate ricorsive
%   della function.
global np;
x1 = (a+b)/2;
if nargin<=4
    fa = feval(f,a);
    fb = feval(f,b);
    f1 = feval(f,x1);
    np = 3;
end
h = (b-a)/6;
x2 = (a+x1)/2;
x3 = (x1+b)/2;
f2 = feval(f ,x2);
f3 = feval(f ,x3);
np = np+2;
I1 = h*(fa+4*f1+fb);
I2 = .5*h*(fa+4*f2+2*f1+4*f3+fb);
e = abs(I2-I1)/15;
if e>tol || np<10
    I2 = simpsonAdattivo(f,a,x1,tol/2,fa,f2,f1) +...
        simpsonAdattivo(f,x1,b,tol/2,f1,f3,fb);
end
return
end