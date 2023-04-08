%ignora questo file 
a = 0; b = 2*pi;
n = 10001; xx = linspace(a,b,n);
f1 = @(x)sin(x);
f2 = @(x)cos(x);


erroreSinKnotKnot = []; erroreCosKnotKnot =[];
erroreSinNaturali = []; erroreCosNaturali =[];
for i = 10:10:100
    xi = linspace(a,b,i);
    fi1 = feval(f1,xi);
    fi2 = feval(f2,xi);

    %knot-a-knot
    ysinKnotKnot = spline(xi,fi1,xx);
    ycosKnotKnot = spline(xi,fi2,xx);

    erroreSinKnotKnot(i/10,:) = feval(f1,xx)-ysinKnotKnot;
    erroreCosKnotKnot(i/10,:) = feval(f2,xx)-ycosKnotKnot;

    %spline naturale
    ysin = spline0(xi,fi1,xx);
    ycos = spline0(xi,fi2,xx);

    erroreSinNaturali(i/10,:) = feval(f1,xx)-ysin;
    erroreCosNaturali(i/10,:) = feval(f2,xx)-ycos;

end
% erroreSinKnotKnot, erroreCosKnotKnot,erroreSinNaturali,erroreCosNaturali
% sono delle matrici contenenti gli errori per ogni n=10,20 fino a 100.
% per vedere l'errore su n = 10 bisogna ad esempio vedere erroreSinNaturali(1,:)
% mentre per n = 20 erroreSinNaturali(2,:) e così via....

Esempio di plot ( i grafici sono riportati comunque tutti nella documentazione) 
%knot-a-knot quando n = 10
plot(xx,erroreSinKnotKnot(1,:),'r+'),drawnow,shg; %errore per il sin
plot(xx,erroreCosKnotKnot(1,:),'c'),drawnow,shg; %errore per il cos

%naturali quando n = 10;
plot(xx,erroreSinNaturali(1,:),'r+'),drawnow,shg; %errore per il sin
plot(xx,erroreCosNaturali(1,:),'c'),drawnow,shg; %errore per il cos
