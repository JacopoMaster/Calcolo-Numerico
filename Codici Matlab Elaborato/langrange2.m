function [t] = langrange2(xi,f,xx)
if (length(xi)~=length(f))
    error("Lunghezza xi non corrisponde agli fi oppure si è passato un vettore dove calcolare il polinomio, supportato solo un punto alla volta");
end
syms z;         %uso una variabile simbolica z per i coefficienti di lagrange così dopo aver 
x = xi(1:2:end); %mi salvo le ascisse non duplicate per trovarmi i coefficienti di lagrange
n=length(x);
temp = 1;
%cin = ones(n,size(xx,2));
%cin1 = ones(n,size(xx,2));
%temp = sym(ones(n,size(xx,2)));
cinalqudrato =  ones(n,size(xx,2));
phi1 = ones(n,size(xx,2)); %phi1 corrisponde a Φin(x)
epsilon = ones(n,size(xx,2)); %epsilon corrisponde a Ψin(x)

%cin = ones(1,n);
                %derivato, posso sotituire xx. Richiede il symbolic toolbox
                % di matlab installato.
%temp = sym(sym('1'),[n size(xx,2)]);
%cin1 = ones(1,n);
%calcolo coefficienti con lagrange
for i = 1:n
        for j=1:n
            if (j~=i)
                temp = temp*(z-x(j))/(x(i)-x(j));
            end
        end
        temp2 = temp;        % mi servirà ancora la non derivata  
        temp = diff(temp,z); %eseguo la derivata sul valore simbolico z
        tt = z;
        cin1 = subs(temp,x(i)); %sostituisco l'x(i) alla derivata
        cinalqudrato(i,:) = (subs(temp2,xx)).^(2);
        z = tt; %ripristino la proprietà simbolica che aveva z prima della sostituzione, siamo in un ciclo.
        phi1(i,:) = cinalqudrato(i,:).*(1-2.*(xx-x(i)).*cin1);
        epsilon(i,:) = (xx-x(i)).*cinalqudrato(i,:);
        temp = 1;
end
sum = 0;
disp(phi1);
disp(epsilon);
for i = 1:1
     sum = (f(2*i-1).*phi1(i,:)+f(2*i).*epsilon(i,:));
end
t = sum;
end

