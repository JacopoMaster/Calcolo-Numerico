function [newtonCotesNormale,sommaSottoIntervalli,erroreCalcolato] ...
                        = approssimazioneIntegraleCon2Intervalli(fun,a,b,n)
%   esercizio 27: approssimazioneIntegraleCon2Intervalli(fun,a,b,n);
%   Suddivide l'intervallo in 2 parti e calcola la funzione nei vari sottointervalli.
%   OUTPUT=> newtonCotesNormale: funzione calcolata tramite coefficienti di newton-cotes sull'intero intervallo
%            sommaSottoIntervalli: restituisce la somma dei valori nei 2 intervalli
%            erroreCalcolato: valore assoluto dell'errore tra le 2 forme utilizzate
h=(b-a)/n;
f = feval(fun,linspace(a,b,n+1));
fsottoIntervallo1 = feval(fun,linspace(a,(a+b)/2,n+1));
fsottoIntervallo2 = feval(fun,linspace((a+b)/2,b,n+1));
nc = coefficientiNC(n);
newtonCotesNormale = h*sum(nc.*f);
I1 = sum(nc.*fsottoIntervallo1); 
I2 = sum(nc.*fsottoIntervallo2); 
sommaSottoIntervalli = h/2*(I2+I1);
erroreCalcolato = abs(newtonCotesNormale-sommaSottoIntervalli);%%/((2.^n)-1);
return
end