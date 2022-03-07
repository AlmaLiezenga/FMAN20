fplot(@(x) g(x), [-3 3]);
fplot(@(x) fg(x), [1 7]);

function g = g(x)
if abs(x) <= 1
    g = abs(x).^3 - times(2,abs(x).^2) + 1 ;
elseif abs(x) > 1 && abs(x) <= 2 
    g = times(-1, abs(x).^3) + times(5, abs(x).^2) - times(8, abs(x)) + 4; 
elseif abs(x) > 2
    g = 0; 
end
end 

function fg = fg(x)
f = [3 4 7 4 3 5 6]; 
n = 7; 
total = 0;
for i = 1:n
    total = total + g(abs(x)-i).*f(i); 
end
fg = total;
end