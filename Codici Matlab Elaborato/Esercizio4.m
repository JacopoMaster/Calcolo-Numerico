function [valore] = Esercizio4(x)
% valore = Esercizio4( x) Metodo per calcolare il seno di un valore x
%                         con x compreso tra -pi e pi.
%                         Restituisce il valore calcolato
if x<-pi || x>pi
    error("valore non consentito");
end
valore = 0;
precedente = x;
j = 0;
while precedente ~= valore
    precedente = valore;
    f=1;
    temp = 2*j+1;
    for i=1:temp
        f=f*i;
    end
    valore = valore+((-1)^j*((x^((2*j)+1))/(f)));
    j = j+1;
end
return