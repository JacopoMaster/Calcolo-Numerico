function [x,itnumber] = newtondef( f, f1, x0, tolx, maxit )
%
% [x,flag] = newton( f, f1, x0, tolx [, maxit] )
%
% Metodo di Newton per determinare una approssimazione
% della radice di f(x)=0 con tolleranza (mista) tolx, a
% partire da x0, entro maxit iterationi (default = 100).
% f1 implementa f’(x) mentre in uscita flag vale -1, se
% la tolleranza non `e soddisfatta entro maxit iterate o
% la derivata si annulla, altrimenti ritorna il numero
% di iterazioni richieste.
%
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
    x = x - fx/f1x;
    fprintf('iteration number %d value %d \n',i,x);
    if abs(x-x0)<=tolx*(1+abs(x0)), itnumber=i+1; break
    else, x0 = x;
    end
end
return