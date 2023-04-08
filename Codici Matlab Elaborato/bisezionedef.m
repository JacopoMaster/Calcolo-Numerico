function x = bisezionedef( a, b, f, tolx )
% x = Bisezione( a, b, f, tolx ) Metodo di bisezione per calcolare
%                                una radice di f(x), interna ad [a,b],
%                                con tolleranza tolx.
if a>=b, error('estremi intervallo errati'), end
if tolx<=0; error('tolleranza non appropriata'), end
fa = feval(f,a);
fb = feval(f,b);
xp=0;
if fa*fb>=0, error('intervallo di confidenza non appropriato'), end
imax = ceil( log2(b-a)-log2(tolx) );
if imax<1, x = (a+b)/2; return, end
fprintf('iteration number %d value %d \n',0,xp);
for i = 1:imax
      x = (a+b)/2;
      fprintf('iteration number %d value %d \n',i,x);
      fx = feval( f, x );
      if abs(x-xp)<=tolx*(1+abs(xp))
          
      break
      elseif fa*fx<0
        b = x; 
      else
        a = x; fa = fx;
      end
      xp = x;
end
return
