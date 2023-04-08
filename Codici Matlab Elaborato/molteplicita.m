function [molteplicita,derivata] = molteplicita(f,punto)
% [molteplicita,derivata] = molteplicita(f,punto)
% Una function che calcola la molteplicità di una funzione f in un punto. 
% Lo script seguente si sostituisce ad un calcolo manuale per calcolare la molteplicità di una funzione.
%                   OUTPUT => molteplicità: moltep. della funzione calcolata
%                             derivata: ultima derivata calcolata
syms x
fx = f(punto); %derivata in 0 non deve fare 0
molteplicita = 0;
derivata = f;
fprintf("non derivata: %s valore: %d\n",func2str(f),fx);
while (fx == 0)
    str = diff(f,x);
    f1 = matlabFunction(str);
    fx = f1(punto); %derivata nel punto non deve fare 0
    molteplicita = molteplicita+1;
    fprintf("derivata: %s ; molteplicita: %d; valore in %d: %d\n",str,molteplicita,punto,fx);
    derivata = str;
    if (fx ~= 0)
        break
    end
    f = f1;
end
return
