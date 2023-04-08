% clc to clear terminal
%calcolo manuale be like:
%
% x0 = 0; x1 = 0.333333; copy = x1; 
% x1 = x1 - feval(f,x1) * ((x1-x0)/feval(f,x1)-feval(f,x0));
% fprintf("%d",x1);
% x0 = copy; copy = x1; x1 = ......

function [niterazioni,x] = secantidef(f,x0,x1,imax,tolx)
fx0=f(x0);
fx1=f(x1);
x=(x0*fx1-x1*fx0)/(fx1-fx0);
fprintf('iteration number %d value %d \n',0,0);
fprintf('iteration number %d value %d \n',1,x);
niterazioni = 2;
for i=2:imax
    if abs(x-x1)<=tolx*(1+abs(x1))
        niterazioni = i;
        break
    end
        x0=x1; fx0=fx1;
        x1=x; fx1=f(x);
        x=(x0*fx1-x1*fx0)/(fx1-fx0);
        fprintf('iteration number %d value %d \n',i,x);
end
return