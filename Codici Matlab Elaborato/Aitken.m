%AITKEN
%function [x,passi]=Aitken(f,df,x0,epsilon,upper)
%
% Trova la radice della funzione f con derivata df 
% applicando il metodo di accelerazione di Aitken 
% con punto iniziale x0, tolleranza epsilon e numero
% massimo di passi upper.
% Restituisce in x il valore della radice e in passi
% il numero di iterazioni eseguite.
function [x,passi] = Aitken(f,df,x0,epsilon,upper)

f0=feval(f,x0);
d=feval(df,x0);
x1=x0-(f0/d);
f1=feval(f,x1);   

d=feval(df,x1);
x2=x1-(f1/d);
f2=feval(f,x2);

count=0;
fprintf('iteration number %d value %d \n',count,x2);

for i=1:upper
   count=count+1;
   x0=(x1*x1-x0*x2)/(2*x1-x2-x0);
   f0=feval(f,x0);
   d=feval(df,x0);
   if d==0
       passi=count+1; 
       break
   end
   x1=x0-(f0/d);
   f1=feval(f,x1);   
   d=feval(df,x1);
   if d == 0 
       passi=count+1; 
       break;
   end
   x2=x1-(f1/d);
   f2=feval(f,x2);   
   fprintf('iteration number %d value %d \n',count,x2);
   if abs(x2-x1)<=epsilon*(1+abs(x1))
       passi=count+1; 
       break; 
   end
end
x=x2;
passi=count+2;
return