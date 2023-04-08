function [x,itnumber] = cordedef(f,tolx,x0,maxIt)
%n è il numero di iterazioni usate per convergere ad un numero
%convergenza è il numero che da quel momento in poi non cambia più se
%iterato ulteriormente.
%se non converge ritorna -1 in itnumber.
syms x;
f1 = matlabFunction(diff(f,x)); %fa la derivata di f
f1x = feval(f1,x0);
if f1x==0
    error("la derivata al denominatore non può essere 0"); 
end
x = x0;
itnumber = -1;
fprintf("derivata calcolata: %s\n",func2str(f1));
fprintf("valore derivata nel punto %d: %d\n",x0,f1x);
fprintf('iteration number %d value %d \n',0,x);
for i = 1:maxIt
    fx = feval(f,x);
    if f1x==0, break, end
    x = x - fx/f1x;
    fprintf('iteration number %d value %.4d \n',i,x);
     if abs(x-x0)<=tolx*(1+abs(x0)), itnumber=i+1; break
        
     end
    x0 = x;
end
return