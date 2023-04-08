function [cin] = coefficientiNC(n)
%esercizio 26: [cin] = coefficientiNC(n)
%                      n: grado per calcolare coefficienti di newton cotes.
cin = ones(1,n);
for i=0:n
    a = poly([0:i-1 i+1:n]);
    b = [a./(n+1:-1:1) 0];
    cin(i+1) = polyval(b,n)/((-1)^(n-i)*factorial(n-i)*factorial(i));
end
return
end

