function [x,itnumber] = newtonmod( f, f1, x0, tolx, maxit,m )
%
% [x,flag] = newtonmod( f, f1, x0, tolx , maxit,m )
%                       Input: f-> funzione su cui applicare il metodo
%                              f1 -> derivata della funzione f
%                              x0 -> punto
%                              tolx -> tolleranza
%                              maxit -> numero massimo di iterazioni
%                              m -> molteplicità
%                      Output: x -> valore di x trovato   
%                              itnumber -> numero dell'iterazione 
if nargin<4, error('numero argomenti insufficienti')
elseif nargin==4, maxit = 100;
end
if tolx<eps, error('tolleranza non idonea'), end
x = x0;
itnumber = -1;
fprintf('iteration number %d value %d \n',0,x);
for i = 1:maxit
    fx = feval( f, x );
    f1x = feval( f1, x );
    if f1x==0, break, end
    x = x - m*(fx/f1x);
    fprintf('iteration number %d value %d \n',i,x);
    if abs(x-x0)<=tolx*(1+abs(x0)), itnumber=i+1; break
    else, x0 = x;
    end
end
return